import argparse
import asyncio
import json
import os
import re
import sys
import urllib.request
from pathlib import Path

from generate_prompt import (
    get_question_details,
    get_reference_solution,
    format_snippets,
    PROMPT_TEMPLATE,
)

PROBLEMS_DIR = Path(__file__).parent / "generated_problems"
GRAPHQL_URL = "https://leetcode.com/graphql"
OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions"
DEFAULT_MODEL = "google/gemini-3.1-flash-lite"
DEFAULT_CONCURRENCY = 10


def fetch_problem_list(skip, limit, hide_premium):
    filters = {"filterCombineType": "ALL"}

    if hide_premium:
        filters["premiumFilter"] = {
            "premiumStatus": ["PREMIUM"],
            "operator": "IS_NOT",
        }

    payload = json.dumps(
        {
            "query": """
            query problemsetQuestionListV2($filters: QuestionFilterInput, $limit: Int, $skip: Int, $categorySlug: String) {
                problemsetQuestionListV2(filters: $filters, limit: $limit, skip: $skip, categorySlug: $categorySlug) {
                    questions { id titleSlug }
                }
            }
        """,
            "variables": {
                "skip": skip,
                "limit": limit,
                "categorySlug": "all-code-essentials",
                "filters": filters,
            },
            "operationName": "problemsetQuestionListV2",
        }
    ).encode()

    req = urllib.request.Request(
        GRAPHQL_URL,
        data=payload,
        headers={
            "Content-Type": "application/json",
            "User-Agent": (
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                "AppleWebKit/537.36 (KHTML, like Gecko) "
                "Chrome/124.0.0.0 Safari/537.36"
            ),
            "Referer": "https://leetcode.com/",
        },
    )

    with urllib.request.urlopen(req, timeout=30) as r:
        data = json.loads(r.read())

    return data["data"]["problemsetQuestionListV2"]["questions"]


async def generate(prompt, model, api_key):
    payload = json.dumps(
        {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
        }
    ).encode()

    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    }

    def do_request():
        req = urllib.request.Request(
            OPENROUTER_URL,
            data=payload,
            headers=headers,
        )

        with urllib.request.urlopen(req, timeout=180) as r:
            return json.loads(r.read())

    return await asyncio.get_event_loop().run_in_executor(None, do_request)


def normalize_ref(code):
    code = code.strip()

    if re.search(r"^\s*class\s+Solution\b", code, re.MULTILINE):
        return code

    indented = "\n".join(
        "    " + line if line.strip() else "" for line in code.splitlines()
    )

    return f"class Solution:\n{indented}\n"


async def process(sem, problem, model, api_key, no_generate):
    pid, slug = problem["id"], problem["titleSlug"]

    folder = PROBLEMS_DIR / f"{pid}. {slug}"
    manifest = folder / "manifest.yml"

    if manifest.exists() and not no_generate:
        print(f"Skip {pid}. {slug}")
        return

    async with sem:
        print(f"Start {pid}. {slug}")

        try:
            _, content, snippets = get_question_details(slug)

            try:
                reference = get_reference_solution(slug)
            except Exception:
                reference = "Not found"

            prompt = PROMPT_TEMPLATE.substitute(
                PROBLEM_ID=pid,
                PROBLEM_TITLE=slug,
                PROBLEM_CONTENT=content,
                SNIPPETS=format_snippets(snippets),
                REFERENCE=reference,
            )

            folder.mkdir(parents=True, exist_ok=True)

            (folder / "prompt.txt").write_text(
                prompt,
                encoding="utf-8",
            )

            (folder / "sol.py").write_text(
                normalize_ref(reference),
                encoding="utf-8",
            )

            if not no_generate:
                data = await generate(prompt, model, api_key)
                raw = data["choices"][0]["message"]["content"]
                clean = re.sub(
                    r"^```[a-zA-Z]*\n?|\n?```$",
                    "",
                    raw.strip(),
                )

                manifest.write_text(
                    clean,
                    encoding="utf-8",
                )

            print(f"Done {pid}. {slug}")

        except Exception as e:
            folder.mkdir(parents=True, exist_ok=True)

            (folder / "error.txt").write_text(
                str(e),
                encoding="utf-8",
            )

            print(f"Error {pid}. {slug}: {e}", file=sys.stderr)


async def run(
    skip,
    limit,
    concurrency,
    model,
    api_key,
    hide_premium,
    no_generate,
):
    PROBLEMS_DIR.mkdir(parents=True, exist_ok=True)

    problems = fetch_problem_list(skip, limit, hide_premium)
    sem = asyncio.Semaphore(concurrency)

    await asyncio.gather(
        *[
            process(
                sem,
                p,
                model,
                api_key,
                no_generate,
            )
            for p in problems
        ]
    )


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("--skip", type=int)
    parser.add_argument("--limit", type=int)
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
        "--hide-premium",
        dest="hide_premium",
        action="store_true",
    )
    parser.add_argument(
        "--no-generate",
        dest="no_generate",
        action="store_true",
    )

    args = parser.parse_args()

    api_key = os.environ.get("OPENROUTER_API_KEY")

    if not args.no_generate and not api_key:
        sys.exit("OPENROUTER_API_KEY is not set")

    asyncio.run(
        run(
            args.skip,
            args.limit,
            args.concurrency,
            args.model,
            api_key,
            args.hide_premium,
            args.no_generate,
        )
    )


if __name__ == "__main__":
    main()
