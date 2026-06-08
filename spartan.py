import argparse
import asyncio
import json
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
DEFAULT_CONCURRENCY = 10


def fetch_problem_list(skip, limit, hide_premium):
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
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
            "Referer": "https://leetcode.com/",
        },
    )
    with urllib.request.urlopen(req, timeout=30) as r:
        data = json.loads(r.read())
    return data["data"]["problemsetQuestionListV2"]["questions"]


def normalize_ref(code):
    code = code.strip()

    if re.search(r"^\s*class\s+Solution\b", code, re.MULTILINE):
        return code

    indented = "\n".join(
        "    " + line if line.strip() else "" for line in code.splitlines()
    )
    return f"class Solution:\n{indented}\n"


async def process(sem, problem):
    pid, slug = problem["id"], problem["titleSlug"]
    folder = PROBLEMS_DIR / f"{pid}. {slug}"

    async with sem:
        print(f"Start {pid}. {slug}")
        try:
            _, content, snippets = await asyncio.to_thread(get_question_details, slug)

            try:
                reference = await asyncio.to_thread(get_reference_solution, slug)
            except Exception:
                reference = None

            prompt = PROMPT_TEMPLATE.substitute(
                PROBLEM_ID=pid,
                PROBLEM_TITLE=slug,
                PROBLEM_CONTENT=content,
                SNIPPETS=format_snippets(snippets),
                REFERENCE="Not found" if reference is None else reference,
            )

            folder.mkdir(parents=True, exist_ok=True)
            (folder / "prompt.txt").write_text(prompt, encoding="utf-8")
            if reference is None:
                (folder / "sol.py").write_text("Not found", encoding="utf-8")
            else:
                (folder / "sol.py").write_text(
                    normalize_ref(reference), encoding="utf-8"
                )

            print(f"Done {pid}. {slug}")
        except Exception as e:
            folder.mkdir(parents=True, exist_ok=True)
            (folder / "error.txt").write_text(str(e), encoding="utf-8")
            print(f"Error {pid}. {slug}: {e}", file=sys.stderr)


async def run(skip, limit, concurrency, hide_premium):
    PROBLEMS_DIR.mkdir(parents=True, exist_ok=True)
    problems = fetch_problem_list(skip, limit, hide_premium)
    sem = asyncio.Semaphore(concurrency)
    await asyncio.gather(*[process(sem, p) for p in problems])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--skip", type=int)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--concurrency", type=int, default=DEFAULT_CONCURRENCY)
    parser.add_argument("--hide-premium", dest="hide_premium", action="store_true")
    args = parser.parse_args()

    asyncio.run(
        run(
            args.skip,
            args.limit,
            args.concurrency,
            args.hide_premium,
        )
    )


if __name__ == "__main__":
    main()
