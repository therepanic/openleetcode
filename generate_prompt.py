import sys
import os
import re
import requests

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TEST_FORMAT_PATH = os.path.join(BASE_DIR, "TEST_FORMAT.md")
GRAPHQL_URL = "https://leetcode.com/graphql"

SUPPORTED_LANGS = {
    "python3": "python3",
    "ruby": "ruby",
    "java": "java",
    "kotlin": "kotlin",
    "go": "golang",
    "dart": "dart",
    "swift": "swift",
}

PROMPT_TEMPLATE = """\
You are helping generate a test manifest for the openleetcode project.

## What is openleetcode

openleetcode is a CLI tool that lets you run LeetCode solutions against test cases locally without a subscription. Test suites are defined in YAML manifests. Solutions are executed in sandboxed runtimes for these languages: python3, ruby, java, kotlin, go, dart, swift.

## Test format (TEST_FORMAT.md)

{TEST_FORMAT}

## Task

Generate a complete manifest.yml for the following problem.

### Problem

{PROBLEM}

### Code snippets

{SNIPPETS}

### Reference solution

{REFERENCE}

## Instructions

1. Generate a complete manifest.yml following the TEST_FORMAT.md spec exactly.
2. Include all examples from the problem as static test cases with `out`.
3. Create a comprehensive set of additional static test cases that cover all edge and tricky scenarios (minimum/maximum values, empty/single‑element inputs, duplicates, negative numbers, large inputs, etc.). For non‑trivial problems aim for a total of around 30–35 test cases (including the examples). If the problem constraints allow safe random generation (inputs are independent and any random combination guarantees a valid answer), you may complement the static cases with generated stress/random tests to reach the target count. If random generation is unreliable (e.g. "exactly one solution exists" cannot be guaranteed randomly), rely solely on static cases and an oracle checker where appropriate.
4. Write an oracle checker in Python3 based on the reference solution (the reference solution may not necessarily be in Python3, but the oracle checker you write will definitely be in Python3). The checker should validate the result structurally, not just re-run the solution.
5. Use the call template signatures from the code snippets above for each language.
6. Output only the manifest.yml. Do not add any comments, explanations. The response must be raw YAML that can be parsed directly.
"""

def gql_request(query, variables):
    resp = requests.post(
        GRAPHQL_URL,
        json={"query": query, "variables": variables},
        headers={"Content-Type": "application/json"},
    )
    resp.raise_for_status()
    data = resp.json()
    if "errors" in data:
        raise RuntimeError(f"Graphql errors: {data['errors']}")
    return data["data"]

def load_test_format():
    if not os.path.exists(TEST_FORMAT_PATH):
        raise FileNotFoundError(f"{TEST_FORMAT_PATH} not found. Run from repo root")
    with open(TEST_FORMAT_PATH, "r", encoding="utf-8") as f:
        return f.read()

def get_question_details(slug):
    query = """
    query questionDetail($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        content
        codeSnippets {
          code
          langSlug
        }
      }
    }
    """
    data = gql_request(query, {"titleSlug": slug})
    q = data["question"]
    if not q:
        raise ValueError(f"Question with slug '{slug}' not found")
    content = q["content"]
    snippets = {}
    for snip in q["codeSnippets"]:
        lang_slug = snip["langSlug"]
        for our_lang, api_lang in SUPPORTED_LANGS.items():
            if api_lang == lang_slug:
                snippets[our_lang] = snip["code"]
                break
    return content, snippets

def extract_python_code_markdown(html_content):
    pattern = r"```\s*[Pp]ython3?\b[^\n]*\n(.*?)```"
    matches = re.findall(pattern, html_content, re.DOTALL)
    if matches:
        return matches[-1].strip()
    return None

def extract_python_code_html(html_content):
    pre_pattern = r"<pre[^>]*>(.*?)</pre>"
    pre_matches = re.findall(pre_pattern, html_content, re.DOTALL)
    for pre in pre_matches:
        if 'language-python' in pre or 'lang-python' in pre:
            code = re.sub(r"<[^>]+>", "", pre).strip()
            if code:
                return code
    code_pattern = r'<code[^>]*class=["\'].*language-python[^>]*>(.*?)</code>'
    code_matches = re.findall(code_pattern, html_content, re.DOTALL)
    if code_matches:
        return code_matches[-1].strip()
    return None

def extract_python_code(html_content):
    code = extract_python_code_markdown(html_content)
    if code and len(code) > 30:
        return code
    fallback = extract_python_code_html(html_content)
    if fallback:
        return fallback
    return code if code else None

def get_reference_solution(slug):
    articles_query = """
    query ugcArticleSolutionArticles(
      $questionSlug: String!,
      $orderBy: ArticleOrderByEnum,
      $userInput: String,
      $tagSlugs: [String!],
      $skip: Int,
      $first: Int
    ) {
      ugcArticleSolutionArticles(
        questionSlug: $questionSlug,
        orderBy: $orderBy,
        userInput: $userInput,
        tagSlugs: $tagSlugs,
        skip: $skip,
        first: $first
      ) {
        edges {
          node {
            topicId
          }
        }
      }
    }
    """
    vars_articles = {
        "questionSlug": slug,
        "orderBy": "HOT",
        "userInput": "",
        "tagSlugs": [],
        "skip": 0,
        "first": 10,
    }
    data = gql_request(articles_query, vars_articles)
    edges = data["ugcArticleSolutionArticles"]["edges"]
    if not edges:
        raise RuntimeError("No ugc solution articles found")

    content_query = """
    query ugcArticleSolutionArticle($topicId: ID) {
      ugcArticleSolutionArticle(topicId: $topicId) {
        content
      }
    }
    """
    for edge in edges:
        topic_id = edge["node"]["topicId"]
        data = gql_request(content_query, {"topicId": str(topic_id)})
        article_html = data["ugcArticleSolutionArticle"]["content"]
        code = extract_python_code(article_html)
        if code and len(code) > 30:
            return code

    raise RuntimeError("No complete Python solution block found in top articles")

def format_snippets(snippets):
    out = []
    for lang in ["python3", "ruby", "java", "kotlin", "go", "dart", "swift"]:
        code = snippets.get(lang)
        if code:
            out.append(f"### {lang}\n```{lang}\n{code}\n```")
    return "\n\n".join(out)

def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <slug>", file=sys.stderr)
        sys.exit(1)
    slug = sys.argv[1]

    sys.stdout.reconfigure(encoding='utf-8')
    sys.stderr.reconfigure(encoding='utf-8')

    test_format = load_test_format()
    problem_content, snippets = get_question_details(slug)

    try:
        reference = get_reference_solution(slug)
    except Exception as e:
        print(f"Could not fetch reference solution {e}", file=sys.stderr)
        reference = "# Reference solution not found"

    prompt = PROMPT_TEMPLATE.format(
        TEST_FORMAT=test_format,
        PROBLEM=problem_content,
        SNIPPETS=format_snippets(snippets),
        REFERENCE=reference,
    )
    print(prompt)

if __name__ == "__main__":
    main()
