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

PROBLEMS_DIR = Path(__file__).parent / "problems"
GRAPHQL_URL = "https://leetcode.com/graphql"
OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions"


def fetch_problem_list(from_id, to_id, hide_premium):
    filters = {"filterCombineType": "ALL"}
    if hide_premium:
        filters["premiumFilter"] = {"premiumStatus": ["PREMIUM"], "operator": "IS_NOT"}

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
                "skip": from_id - 1,
                "limit": to_id - from_id + 1,
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
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
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
        req = urllib.request.Request(OPENROUTER_URL, data=payload, headers=headers)
        with urllib.request.urlopen(req, timeout=180) as r:
            return json.loads(r.read())

    return await asyncio.get_event_loop().run_in_executor(None, do_request)


async def process(sem, problem, model, api_key):
    pid, slug = problem["id"], problem["titleSlug"]
    folder = PROBLEMS_DIR / f"{pid}. {slug}"
    manifest = folder / "manifest.yml"

    if manifest.exists():
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

            data = await generate(prompt, model, api_key)
            raw = data["choices"][0]["message"]["content"]
            clean = re.sub(r"^```[a-zA-Z]*\n?|\n?```$", "", raw.strip())

            folder.mkdir(parents=True, exist_ok=True)
            (folder / "prompt.txt").write_text(prompt, encoding="utf-8")
            (folder / "sol.py").write_text(reference, encoding="utf-8")
            manifest.write_text(clean, encoding="utf-8")

            print(f"Done {pid}. {slug}")
        except Exception as e:
            folder.mkdir(parents=True, exist_ok=True)
            (folder / "error.txt").write_text(str(e), encoding="utf-8")
            print(f"Error {pid}. {slug}: {e}", file=sys.stderr)


async def run(from_id, to_id, concurrency, model, api_key, hide_premium=False):
    PROBLEMS_DIR.mkdir(parents=True, exist_ok=True)
    problems = fetch_problem_list(from_id, to_id, hide_premium)
    sem = asyncio.Semaphore(concurrency)
    await asyncio.gather(*[process(sem, p, model, api_key) for p in problems])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--from", dest="from_id", type=int)
    parser.add_argument("--to", dest="to_id", type=int)
    parser.add_argument("--concurrency", type=int, default=10)
    parser.add_argument(
        "--model",
        default="google/gemini-3.1-flash-lite",
    )
    parser.add_argument("--hide-premium", dest="hide_premium", action="store_true")
    args = parser.parse_args()

    api_key = os.environ.get("OPENROUTER_API_KEY")
    if not api_key:
        sys.exit("OPENROUTER_API_KEY is not set")

    asyncio.run(
        run(
            args.from_id,
            args.to_id,
            args.concurrency,
            args.model,
            api_key,
            args.hide_premium,
        )
    )


if __name__ == "__main__":
    main()
