import sys
import os
import re
import requests
from string import Template

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
GRAPHQL_URL = "https://leetcode.com/graphql"

SNIPPET_LANGS = [
    "python3",
    "ruby",
    "java",
    "kotlin",
    "go",
    "dart",
    "swift",
    "typescript",
    "rust",
    "cpp",
]

SUPPORTED_LANGS = {
    "python3": "python3",
    "python2": "python",
    "ruby": "ruby",
    "cpp": "cpp",
    "java": "java",
    "kotlin": "kotlin",
    "go": "golang",
    "dart": "dart",
    "swift": "swift",
    "rust": "rust",
    "typescript": "typescript",
}

PROMPT_TEMPLATE = Template("""
You are helping generate a test manifest for the openleetcode project.

openleetcode is a CLI tool to run LeetCode solutions locally. Test suites are YAML manifests. Supported languages: cpp, rust, python3, python2, ruby, java, kotlin, go, dart, swift, typescript.

Generate 25-30 tests.

CRITICAL YAML RULE:
Never use flow-style mappings { } anywhere in the output.
Every mapping must use block style (indented lines).
This applies to ALL fields including gen, const, and inline params.

---

## Manifest structure

Top-level fields in this exact order - nothing is nested inside entry:

entry:
  id: <int>
  title: <string>
  call:
    cpp: "..."
    rust: "..."
    python3: "..."
    python2: "..."
    ruby: "..."
    java: "..."
    kotlin: "..."
    go: "..."
    dart: "..."
    swift: "..."
    typescript: "..."

judge:
  type: "exact" | "ignore_order"

limits:
  time_ms: <int>
  memory_mb: <int>

oracle:
  python3:
    call: "..."
    checker: |
      <python source, must return bool>

seed: <int>

tests:
  - name: "..."
    in:
      param1: <value or generator>
    out: <value>
    judge: ...
    seed: ...

judge MUST always be object form. NEVER write:
judge: "exact"

Correct form:
judge:
  type: "exact"

---

## Static values in `in`

1D arrays and scalars - write directly, no gen wrapper:

in:
  nums: [1, 3, 4, 8]
  target: 9

2D arrays - ALWAYS multiline block style.
NEVER flow style. No exceptions.

CORRECT - 1x1:

in:
  matrix:
    gen: "array"
    elemType: "int"
    const:
      - [5]
  target: 3

CORRECT - 3x4:

in:
  matrix:
    gen: "array"
    elemType: "int"
    const:
      - [1, 3, 5, 7]
      - [10, 11, 16, 20]
      - [23, 30, 34, 60]
  target: 3

WRONG - never do this:

matrix: { gen: "array", elemType: "int", const: [[1,3,5,7]] }
matrix: { gen: "array", elemType: "int", const: [[1]] }

Nested `out` (e.g. matrices): SAME rule as 2D `in` - ALWAYS multiline block style, real line breaks, one `- [ ... ]` row per dimension. NEVER a single YAML string holding the entire JSON (`out: '[[...]]'` and similar).

CORRECT:
  out:
    - [1, 2, 3]
    - [4, 5, 6]

WRONG:
  out: "[[1,2,3],[4,5,6]]"

Judge `exact` still compares the solution's last stdout line to compact JSON (no extra whitespace).

---

## Call template syntax

RULE:
Every array param MUST be wrapped in ALL 11 languages. No exceptions.

1D array {x}:
  → [{x}]
  → new int[]{ {x} }
  → vec![{x}]
  → []int{ {x} }
  → intArrayOf({x})
  → lv(vector<int>{ {x} })

2D array {x}:
  → [{x}]
  → new int[][]{ {x} }
  → vec![{x}]
  → [][]int{ {x} }
  → arrayOf({x})
  → lv(vector<vector<int>>{ {x} })

scalar {x}:
  → {x}

{result} in oracle call:
  → always bare, never wrap

Example - method(nums []int, target int):

call:
  cpp: "Solution().method(lv(vector<int>{ {nums} }), {target})"
  rust: "Solution::method(vec![{nums}], {target})"
  python3: "Solution().method([{nums}], {target})"
  python2: "Solution().method([{nums}], {target})"
  ruby: "method([{nums}], {target})"
  java: "new Solution().method(new int[]{ {nums} }, {target})"
  kotlin: "Solution().method(intArrayOf({nums}), {target})"
  go: "method([]int{ {nums} }, {target})"
  dart: "Solution().method([{nums}], {target})"
  swift: "Solution().method([{nums}], {target})"
  typescript: "method([{nums}], {target})"

oracle:
  python3:
    call: "Checker().method([{nums}], {target}, {result})"

---

Example - method(arr []int, queries [][]int):

call:
  cpp: "Solution().method(lv(vector<int>{ {arr} }), lv(vector<vector<int>>{ {queries} }))"
  rust: "Solution::method(vec![{arr}], vec![{queries}])"
  python3: "Solution().method([{arr}], [{queries}])"
  python2: "Solution().method([{arr}], [{queries}])"
  ruby: "method([{arr}], [{queries}])"
  java: "new Solution().method(new int[]{ {arr} }, new int[][]{ {queries} })"
  kotlin: "Solution().method(intArrayOf({arr}), arrayOf({queries}))"
  go: "method([]int{ {arr} }, [][]int{ {queries} })"
  dart: "Solution().method([{arr}], [{queries}])"
  swift: "Solution().method([{arr}], [{queries}])"
  typescript: "method([{arr}], [{queries}])"

oracle:
  python3:
    call: "Checker().method([{arr}], [{queries}], {result})"

---

Example - method(matrix [][]int, target int):

call:
  cpp: "Solution().method(lv(vector<vector<int>>{ {matrix} }), {target})"
  rust: "Solution::method(vec![{matrix}], {target})"
  python3: "Solution().method([{matrix}], {target})"
  python2: "Solution().method([{matrix}], {target})"
  ruby: "method([{matrix}], {target})"
  java: "new Solution().method(new int[][]{ {matrix} }, {target})"
  kotlin: "Solution().method(arrayOf({matrix}), {target})"
  go: "method([][]int{ {matrix} }, {target})"
  dart: "Solution().method([{matrix}], {target})"
  swift: "Solution().method([{matrix}], {target})"
  typescript: "method([{matrix}], {target})"

oracle:
  python3:
    call: "Checker().method([{matrix}], {target}, {result})"

WRONG:
call: "Checker().method({matrix}, {target}, {result})"

RIGHT:
call: "Checker().method([{matrix}], {target}, {result})"

---

## Generators

CORRECT block style:

gen: "int"
min: 0
max: 100

gen: "float"
min: 0.0
max: 1.0
precision: 2

gen: "str"
len:
  gen: "int"
  min: 1
  max: 10
alphabet: ["a","b","c"]

gen: "char"
variety: ["a","b","c"]

gen: "bool"

---

1D array:

gen: "array"
len:
  gen: "int"
  min: 1
  max: 20
of:
  gen: "int"
  min: 0
  max: 100
distinct: false
sorted: false
elemType: "int"

---

2D array static - ALWAYS multiline:

gen: "array"
elemType: "int"
const:
  - [1, 2, 3]
  - [4, 5, 6]

---

## Runtime utilities

ListNode:

python3/python2/dart/swift:
  "list_node_to_array(Solution().method(to_list_node([{l1}])))"

rust:
  "ListNode::list_node_to_array(Solution::method(ListNode::to_list_node(vec![{l1}])))"

cpp:
  "listNodeToArray(Solution().method(toListNode(lv(vector<int>{ {l1} }))))"

ruby:
  "list_node_to_array(method(to_list_node([{l1}])))"

java:
  "ListNode.listNodeToArray(new Solution().method(ListNode.toListNode(new int[]{ {l1} })))"

kotlin:
  "listNodeToArray(Solution().method(toListNode(intArrayOf({l1}))))"

go:
  "listNodeToArray(method(toListNode([]int{ {l1} })))"

typescript:
  "listNodeToArray(method(toListNode([{l1}])))"

---

TreeNode (input):

python3/python2/dart/swift:
  "Solution().method(to_tree_node([{root}]))"

rust:
  "Solution::method(TreeNode::to_tree_node(vec![{root}]))"

cpp:
  "Solution().method(toTreeNode(lv(vector<optional<int>>{ {root} })))"

ruby:
  "Solution.new.method(to_tree_node([{root}]))"

java:
  "new Solution().method(TreeNode.toTreeNode(new Integer[]{ {root} }))"

kotlin:
  "Solution().method(toTreeNode(arrayOf({root})))"

go:
  "method(toTreeNode([]interface{}{ {root} }))"

typescript:
  "method(toTreeNode([{root}]))"

---

TreeNode (output):

python3/python2/dart/swift:
  "tree_node_to_array(Solution().method(to_tree_node([{root}])))"

rust:
  "TreeNode::tree_node_to_array(Solution::method(TreeNode::to_tree_node(vec![{root}])))"

cpp:
  "treeNodeToArray(Solution().method(toTreeNode(lv(vector<optional<int>>{ {root} }))))"

ruby:
  "tree_node_to_array(Solution.new.method(to_tree_node([{root}])))"

java:
  "TreeNode.treeNodeToArray(new Solution().method(TreeNode.toTreeNode(new Integer[]{ {root} })))"

kotlin:
  "treeNodeToArray(Solution().method(toTreeNode(arrayOf({root}))))"

go:
  "treeNodeToArray(method(toTreeNode([]interface{}{ {root} })))"

typescript:
  "treeNodeToArray(method(toTreeNode([{root}])))"

Trees: compressed BFS, null marks absent child, trailing nulls stripped.

---

## Instructions

1. If the problem is SQL, concurrency, or design (class with multiple methods), output only:
   CANNOT_GENERATE: <reason>

2. Otherwise generate manifest.yml:

- All problem examples as static tests
- Use `out` only when the problem has exactly one correct answer
- Use oracle for problems where multiple valid answers exist
- 25-30 tests total covering edge cases:
  - min/max values
  - single element
  - duplicates
  - large values
  - boundary conditions

- Tests without `out` automatically use the top-level oracle. Do NOT repeat or redefine oracle in tests.
- String parameters MUST always be quoted in calls ("{s}")
- Use generators when possible; if not possible, do not use them
- Generated tests MUST use oracle (no `out`)
- The checker MUST define a class `Checker` with the method used in oracle.call.
- Use generators ONLY when all constraints can be satisfied independently
- Use ~5 generated tests (using gen) when constraints allow
- Large tests MUST use explicit large sizes (e.g. 50000-100000 for strings/arrays) when constraints allow
- Include at least 2 large tests near maximum input size
- Static 2D arrays MUST always use multiline block style const rows, never flow style
- Every test without out must use oracle
- Ensure oracle call is correct
- Generator ranges must match problem constraints exactly
- Oracle checker in Python3 validates structurally (not just re-run solution)
- Follow call wrapping rules exactly for all 11 languages

3. Output only raw YAML.
   No comments, no explanation.

---

## Task

Generate a complete manifest.yml for the following problem.

### Problem

## Id
$PROBLEM_ID

## Title
$PROBLEM_TITLE

## Content

$PROBLEM_CONTENT

### Code snippets

$SNIPPETS

### Reference solution

$REFERENCE
""")


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


def get_question_details(slug):
    query = """
    query questionDetail($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        content
        questionId
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
    question_id = q["questionId"]
    snippets = {}
    for snip in q["codeSnippets"]:
        lang_slug = snip["langSlug"]
        for our_lang, api_lang in SUPPORTED_LANGS.items():
            if api_lang == lang_slug:
                snippets[our_lang] = snip["code"]
                break
    return question_id, content, snippets


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
        if "language-python" in pre or "lang-python" in pre:
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
        "first": 50,
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
    for lang in SNIPPET_LANGS:
        code = snippets.get(lang)
        if code:
            out.append(f"### {lang}\n```{lang}\n{code}\n```")
    return "\n\n".join(out)


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <slug>", file=sys.stderr)
        sys.exit(1)
    slug = sys.argv[1]

    sys.stdout.reconfigure(encoding="utf-8")
    sys.stderr.reconfigure(encoding="utf-8")

    question_id, problem_content, snippets = get_question_details(slug)

    try:
        reference = get_reference_solution(slug)
    except Exception as e:
        print(f"Could not fetch reference solution {e}", file=sys.stderr)
        reference = "# Reference solution not found"

    prompt = PROMPT_TEMPLATE.substitute(
        PROBLEM_ID=question_id,
        PROBLEM_TITLE=slug,
        PROBLEM_CONTENT=problem_content,
        SNIPPETS=format_snippets(snippets),
        REFERENCE=reference,
    )
    print(prompt)


if __name__ == "__main__":
    main()
