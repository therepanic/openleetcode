import argparse
import concurrent.futures
import json
import os
import re
import sys
import urllib.request
from pathlib import Path
from string import Template

PROBLEMS_DIR = Path(__file__).parent / "generated_problems"
OPENROUTER_URL = "https://openrouter.ai"
DEFAULT_MODEL = "deepseek/deepseek-v4-pro"
DEFAULT_CONCURRENCY = 10
TARGET_LANGS = [
    "python",
    "ruby",
    "java",
    "kotlin",
    "go",
    "dart",
    "swift",
    "typescript",
    "rust",
    "cpp",
    "csharp",
]
OUTPUT_EXTENSIONS = {
    "python": "py2",
    "ruby": "rb",
    "java": "java",
    "kotlin": "kt",
    "go": "go",
    "dart": "dart",
    "swift": "swift",
    "typescript": "ts",
    "rust": "rs",
    "cpp": "cpp",
    "csharp": "cs",
}
FENCE_PATTERN = re.compile(r"```([a-zA-Z0-9_+-]+)\n(.*?)```", re.DOTALL)

RUNTIME_CONTEXT = """
Runtime:
cpp C++23; rust 1.88 edition 2024; python3 3.14; python2 2.7;
ruby 3.2; java 25; csharp .NET 10; kotlin 2.1; go 1.23;
dart 3.2; swift 6.0; typescript 5.7 ES2024.

Available extras:
python sortedcontainers; rust rand/regex/itertools; go gods;
dart collection; swift algorithms/collections/numerics;
typescript lodash/datastructures-js; java Pair; ruby Algorithms.

No imports/includes/package declarations unless already in snippet.
"""

PROMPT_TEMPLATE = Template("""
You are a code generator.

Runtime:
$RUNTIME_CONTEXT

Input:
$SNIPPETS

$PYTHON_SOLUTION

Task:
Implement ALL languages in SNIPPETS except python3 using logic from PYTHON_SOLUTION.

Rules:
- no explanations
- no python3 output
- only fill function bodies
- keep exact signatures
- LeetCode-style solutions, no imports / includes / package declarations
- All necessary imports have already been imported
- output all languages in one block of code
- code block language must match the snippet name, e.g. ```java, ```go, ```ruby
- must be equivalent to Python logic

Return ONLY code.
""")


def generate(prompt, model, api_key):
    payload = json.dumps(
        {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
            "reasoning": {"effort": "none"},
        }
    ).encode()

    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    }

    req = urllib.request.Request(
        OPENROUTER_URL + "/api/v1/chat/completions",
        data=payload,
        headers=headers,
    )

    with urllib.request.urlopen(req, timeout=180) as r:
        return json.loads(r.read())


def extract_snippets(prompt_text):
    start_marker = "### Code snippets"
    end_marker = "### Reference solution"
    start = prompt_text.find(start_marker)
    start += len(start_marker)
    end = prompt_text.find(end_marker, start)
    snippets = prompt_text[start:end].strip()
    return snippets


def extract_requested_langs(snippets):
    langs = []
    for lang in TARGET_LANGS:
        if re.search(rf"^### {re.escape(lang)}\s*$", snippets, re.MULTILINE):
            langs.append(lang)
    return langs


def parse_generated_blocks(raw):
    blocks = {}
    for lang, code in FENCE_PATTERN.findall(raw):
        blocks[lang.strip().lower()] = code.strip() + "\n"
    return blocks


def output_path(folder, lang):
    ext = OUTPUT_EXTENSIONS.get(lang, lang)
    return folder / f"sol.{ext}"


def process(folder, model, api_key):
    print(f"Start {folder.name}")

    prompt_path = folder / "prompt.txt"
    python_solution_path = folder / "sol.py"

    prompt_text = prompt_path.read_text(encoding="utf-8")
    snippets = extract_snippets(prompt_text)
    langs = extract_requested_langs(snippets)

    python_solution = python_solution_path.read_text(encoding="utf-8").strip()

    prompt = PROMPT_TEMPLATE.substitute(
        RUNTIME_CONTEXT=RUNTIME_CONTEXT.strip(),
        SNIPPETS=snippets,
        PYTHON_SOLUTION=python_solution,
    )

    data = generate(prompt, model, api_key)
    raw = data["choices"][0]["message"]["content"].strip()
    blocks = parse_generated_blocks(raw)

    missing = [lang for lang in langs if lang not in blocks]
    if missing:
        raise ValueError(f"Missing code blocks for languages: {', '.join(missing)}")

    for lang in langs:
        output_path(folder, lang).write_text(
            blocks[lang],
            encoding="utf-8",
        )

    print(f"Done {folder.name}")


def run(concurrency, model, api_key, limit, skip):
    if not PROBLEMS_DIR.exists():
        raise FileNotFoundError(f"{PROBLEMS_DIR} does not exist")

    problems = sorted(path for path in PROBLEMS_DIR.iterdir() if path.is_dir())
    skip = skip or 0
    if limit is not None:
        problems = problems[skip : skip + limit]
    else:
        problems = problems[skip:]

    problem_iter = iter(problems)

    with concurrent.futures.ThreadPoolExecutor(max_workers=concurrency) as executor:
        futures = {}
        for _ in range(concurrency):
            folder = next(problem_iter, None)
            if not folder:
                break
            fut = executor.submit(process, folder, model, api_key)
            futures[fut] = folder
        while futures:
            done, _ = concurrent.futures.wait(
                futures,
                return_when=concurrent.futures.FIRST_COMPLETED,
            )
            for fut in done:
                folder = futures.pop(fut)
                fut.result()
                next_folder = next(problem_iter, None)
                if next_folder:
                    new_fut = executor.submit(process, next_folder, model, api_key)
                    futures[new_fut] = next_folder


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--concurrency",
        type=int,
        default=DEFAULT_CONCURRENCY,
    )
    parser.add_argument(
        "--model",
        default=DEFAULT_MODEL,
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
    )
    parser.add_argument(
        "--skip",
        type=int,
        default=None,
    )

    args = parser.parse_args()
    api_key = os.environ.get("OPENROUTER_API_KEY")

    if not api_key:
        sys.exit("OPENROUTER_API_KEY is not set")

    run(args.concurrency, args.model, api_key, args.limit, args.skip)


if __name__ == "__main__":
    main()
