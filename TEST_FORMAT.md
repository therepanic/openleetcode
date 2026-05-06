# Test Suite Format

This document describes the YAML format for writing test suites in openleetcode.

Each problem has one test file located at `tests/<range>/<id>. <title>/manifest.yaml`.

---

## Top-Level Structure

```yaml
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

judge:
  type: "exact" | "ignore_order"

limits:
  time_ms: <int>
  memory_mb: <int>

oracle:
  python3:
    call: "..."
    checker: |
      <python source code>

seed: <int>

tests:
  - ...
```

| Field    | Required | Description                                                        |
| -------- | -------- | ------------------------------------------------------------------ |
| `entry`  | ✅       | Problem metadata and per-language call templates                   |
| `judge`  | ✅       | Default judge for all test cases                                   |
| `limits` | ✅       | Time and memory limits applied to every run                        |
| `oracle` | ✅       | Per-language checker used when a test case has no `out` field      |
| `seed`   | ✅       | Global random seed (used when a test case doesn't specify its own) |
| `tests`  | ✅       | List of test cases                                                 |

---

## `entry`

```yaml
entry:
  id: 1
  title: "two-sum"
  call:
    rust: "Solution::two_sum(vec![{nums}], {target})"
    cpp: "Solution().twoSum(lv(vector<int>{ {nums} }), {target})"
    python3: "Solution().twoSum([{nums}], {target})"
    java: "new Solution().twoSum(new int[] { {nums} }, {target})"
    go: "twoSum([]int{ {nums} }, {target})"
    # ... other languages
```

`call` templates use `{param_name}` placeholders. At runtime, placeholders are replaced with the actual values of the test case inputs by their name.

**Supported languages:** `cpp`, `rust`, `python3`, `python2`, `ruby`, `java`, `kotlin`, `go`, `dart`, `swift`

---

## `judge`

```yaml
judge:
  type: "exact"
```

| Value          | Behaviour                                                  |
| -------------- | ---------------------------------------------------------- |
| `exact`        | Output must match expected output exactly                  |
| `ignore_order` | Output is treated as a set - element order does not matter |

This is the **default** judge. Individual test cases can override it.

---

## `limits`

```yaml
limits:
  time_ms: 200
  memory_mb: 300
```

Applied to every test case execution regardless of language.

---

## `oracle`

Used when a test case has no `out` field. The oracle runs the checker on the solution's output to determine correctness.

```yaml
oracle:
  python3:
    call: "Checker().twoSum([{nums}], {target}, {result})"
    checker: |
      import json
      from typing import List

      class Checker:
          def twoSum(self, nums: List[int], target: int, result: str) -> bool:
              try:
                  indices = json.loads(result)
              except:
                  return False
              if not isinstance(indices, list) or len(indices) != 2:
                  return False
              i, j = indices
              if i == j or not (0 <= i < len(nums) and 0 <= j < len(nums)):
                  return False
              return nums[i] + nums[j] == target
```

`call` receives the same input placeholders as the solution call, plus `{result}` which is the solution's output as a string.

`checker` must be a full source file. The call expression must return a `bool`.

---

## `tests`

A list of test cases. Test cases differ along two independent axes:

- **How `in` is produced:** each parameter value is either a plain YAML value (static) or a generator spec (has a `gen` field). Both can be mixed freely within the same `in` block.
- **How the output is checked:** if `out` is provided, the judge is used; if `out` is omitted, the oracle is used instead.

---

### Test Case Fields

```yaml
- name: "ex1_basic"
  judge: # optional - overrides the top-level judge
    type: "ignore_order"
  call: # optional - overrides the top-level entry.call for this case only
    python3: "Solution().twoSum([{nums}], {target})"
  seed: 111 # optional - overrides the suite-level seed for generated inputs
  in:
    nums: [2, 7, 11, 15] # static value
    target: { gen: "int", min: 0, max: 100 } # generated value
  out: [0, 1]
```

| Field   | Required | Description                                                                              |
| ------- | -------- | ---------------------------------------------------------------------------------------- |
| `name`  | ✅       | Unique name for this test case                                                           |
| `in`    | ✅       | Map of input parameter names to values or generator specs                                |
| `out`   | ❌       | Expected output. If provided, the judge is used. If omitted, the oracle is used instead. |
| `judge` | ❌       | Overrides the suite-level judge for this case                                            |
| `call`  | ❌       | Overrides the suite-level call templates for this case                                   |
| `seed`  | ❌       | Random seed for generated inputs in this case, falls back to suite-level `seed`          |

Each value in `in` is either a plain YAML value (string, number, array, bool) or a generator spec identified by a `gen` field. They can be mixed freely.

> [!NOTE]
> The same YAML shapes work for `out` (nested lists are interpreted as nested JSON). With `exact`, the compact JSON text must match the submission's last stdout line\*character-for-character. With `ignore_order`, both sides are parsed as JSON and arrays are sorted recursively before comparison - use `exact` when row/column order of a matrix must match. Without `out`, the oracle parses `{result}` in Python however you define the checker.

---

## Generator Specifications

Generators describe how to randomly produce a value. Every generator object has a `gen` field that identifies its type.

---

### `int` - Integer

```yaml
{ gen: "int", min: -100, max: 100 }
```

Or a constant:

```yaml
42
```

| Field | Required | Description               |
| ----- | -------- | ------------------------- |
| `min` | ✅       | Minimum value (inclusive) |
| `max` | ✅       | Maximum value (inclusive) |

---

### `float` - Float

```yaml
{ gen: "float", min: -1.0, max: 1.0, precision: 2 }
```

Or a constant:

```yaml
3.14
```

| Field       | Required | Description                               |
| ----------- | -------- | ----------------------------------------- |
| `min`       | ✅       | Minimum value (inclusive)                 |
| `max`       | ✅       | Maximum value (inclusive)                 |
| `precision` | ❌       | Number of decimal places. Defaults to `0` |

---

### `str` - String

```yaml
{ gen: "str", len: 100000, alphabet: ["a", "b", "c"] }
```

Or a constant:

```yaml
"hello"
```

| Field      | Required | Description                                                            |
| ---------- | -------- | ---------------------------------------------------------------------- |
| `len`      | ✅       | Length of the string - either a constant integer or an `int` generator |
| `alphabet` | ✅       | List of characters to draw from                                        |

---

### `char` - Single character

```yaml
{ gen: "char", variety: ["a", "b", "c"] }
```

Or a constant:

```yaml
"b"
```

| Field     | Required | Description                              |
| --------- | -------- | ---------------------------------------- |
| `variety` | ✅       | List of characters to randomly pick from |

---

### `bool` - Boolean

```yaml
{ gen: "bool" }
```

Or a constant:

```yaml
true
```

---

### `array` - Array

```yaml
gen: "array"
distinct: false
sorted: false
elemType: "int" # mainly for Java/Kotlin typed inner arrays in 2D cases
len: { gen: "int", min: 1, max: 20 }
of: { gen: "int", min: 0, max: 9 }
```

Or a constant (written as a plain YAML array):

```yaml
[1, 2, 3]
```

| Field      | Required | Description                                                                                       |
| ---------- | -------- | ------------------------------------------------------------------------------------------------- |
| `len`      | ✅       | Length - constant integer or `int` generator                                                      |
| `of`       | ✅       | Generator for each element - any generator type                                                   |
| `distinct` | ❌       | Whether all elements must be unique. Defaults to `false`                                          |
| `sorted`   | ❌       | Whether the array must be sorted ascending. Defaults to `false`                                   |
| `elemType` | ❌       | Element type hint for typed runtimes (`int`, `long`, `double`, `float`, `string`, `char`, `bool`) |

Arrays can be nested (for example, 2D arrays) by using `of: { gen: "array", ... }`.

```yaml
in:
  matrix:
    gen: "array"
    distinct: false
    sorted: false
    elemType: "int"
    len: { gen: "int", min: 1, max: 4 }
    of:
      gen: "array"
      distinct: false
      sorted: false
      len: { gen: "int", min: 1, max: 5 }
      of: { gen: "int", min: 0, max: 9 }
```

You can also provide a static 2D array directly:

```yaml
in:
  matrix:
    gen: "array"
    elemType: "int"
    const:
      - [1, 2, 3]
      - [4, 5, 6]
```

More 2D examples with other element types:

```yaml
# float (generated)
in:
  matrixFloatGen:
    gen: "array"
    elemType: "float"
    len: { gen: "int", min: 1, max: 3 }
    of:
      gen: "array"
      len: { gen: "int", min: 1, max: 4 }
      of: { gen: "float", min: -10.0, max: 10.0, precision: 2 }
```

```yaml
# float (static)
in:
  matrixFloatConst:
    gen: "array"
    elemType: "float"
    const:
      - [1.25, 2.5]
      - [-3.0, 4.75]
```

`double` uses the same shape as `float`: keep everything the same and switch `elemType` to `double` (and use `gen: "float"` for values).

```yaml
# string (generated)
in:
  matrixStringGen:
    gen: "array"
    elemType: "string"
    len: { gen: "int", min: 1, max: 3 }
    of:
      gen: "array"
      len: { gen: "int", min: 1, max: 4 }
      of:
        gen: "str"
        len: { gen: "int", min: 1, max: 3 }
        alphabet: ["a", "b", "c", "d"]
```

```yaml
# string (static)
in:
  matrixStringConst:
    gen: "array"
    elemType: "string"
    const:
      - ["aa", "bb"]
      - ["cc", "dd"]
```

```yaml
# char (generated)
in:
  matrixCharGen:
    gen: "array"
    elemType: "char"
    len: { gen: "int", min: 1, max: 3 }
    of:
      gen: "array"
      len: { gen: "int", min: 1, max: 4 }
      of:
        gen: "char"
        variety: ["a", "b", "c", "d", "e"]
```

```yaml
# char (static)
in:
  matrixCharConst:
    gen: "array"
    elemType: "char"
    const:
      - ["a", "b"]
      - ["c", "d"]
```

```yaml
# bool (generated)
in:
  matrixBoolGen:
    gen: "array"
    elemType: "bool"
    len: { gen: "int", min: 1, max: 3 }
    of:
      gen: "array"
      len: { gen: "int", min: 1, max: 4 }
      of: { gen: "bool" }
```

```yaml
# bool (static)
in:
  matrixBoolConst:
    gen: "array"
    elemType: "bool"
    const:
      - [true, false]
      - [false, true]
```

For `call`, use the same syntax principle for 2D as for 1D: keep the usual language wrapper and only increase dimensionality (`int[] -> int[][]`, `[]int -> [][]int`, `intArrayOf(...) -> arrayOf(intArrayOf(...))`).

---

## Full Example

```yaml
entry:
  id: 1
  title: "two-sum"
  call:
    cpp: "Solution().twoSum(lv(vector<int>{ {nums} }), {target})"
    rust: "Solution::two_sum(vec![{nums}], {target})"
    python3: "Solution().twoSum([{nums}], {target})"
    python2: "Solution().twoSum([{nums}], {target})"
    ruby: "two_sum([{nums}], {target})"
    java: "new Solution().twoSum(new int[] { {nums} }, {target})"
    kotlin: "Solution().twoSum(intArrayOf({nums}), {target})"
    go: "twoSum([]int{ {nums} }, {target})"
    dart: "Solution().twoSum([{nums}], {target})"
    swift: "Solution().twoSum([{nums}], {target})"

judge:
  type: "ignore_order"

seed: 2000

limits:
  time_ms: 200
  memory_mb: 300

oracle:
  python3:
    call: "Checker().twoSum([{nums}], {target}, {result})"
    checker: |
      import json
      from typing import List
      class Checker:
          def twoSum(self, nums: List[int], target: int, result: str) -> bool:
              try:
                  indices = json.loads(result)
              except:
                  return False
              if not isinstance(indices, list) or len(indices) != 2:
                  return False
              i, j = indices
              if i == j or not (0 <= i < len(nums) and 0 <= j < len(nums)):
                  return False
              return nums[i] + nums[j] == target

tests:
  - name: "ex1_basic"
    in:
      nums: [2, 7, 11, 15]
      target: 9
    out: [0, 1]

  - name: "ex2_basic"
    in:
      nums: [3, 2, 4]
      target: 6
    out: [1, 2]

  # Note: generated tests are not included in the real two-sum suite because the task
  # guarantees exactly one answer and nums must depend on target, so generation is shown
  # here as an example only.
  - name: "random_small"
    seed: 111
    in:
      nums:
        gen: "array"
        distinct: false
        sorted: false
        len: { gen: "int", min: 2, max: 20 }
        of: { gen: "int", min: -100, max: 100 }
      target: { gen: "int", min: -200, max: 200 }

  - name: "stress_large"
    seed: 222
    in:
      nums:
        gen: "array"
        distinct: false
        sorted: false
        len: { gen: "int", min: 80000, max: 100000 }
        of: { gen: "int", min: 0, max: 1000000000 }
      target: { gen: "int", min: 0, max: 2000000000 }
```

## Runtime Utilities

Each language runtime ships with a `utilities` file that is automatically prepended to the generated test code. It contains JSON serialization helpers and pre-built converters for common LeetCode data structures.

### Linked List (`ListNode`)

Each runtime provides helpers to convert between plain integer arrays and `ListNode`. Use them directly in `call` templates - see the example below for the exact name per language.

**Example - problem 2 "Add Two Numbers":**

```yaml
entry:
  id: 2
  title: "add-two-numbers"
  call:
    cpp: "listNodeToArray(Solution().addTwoNumbers(toListNode(lv(vector<int>{ {l1} })), toListNode(lv(vector<int>{ {l2} }))))"
    rust: "ListNode::list_node_to_array(Solution::add_two_numbers(ListNode::to_list_node(vec![{l1}]), ListNode::to_list_node(vec![{l2}])))"
    python3: "list_node_to_array(Solution().addTwoNumbers(to_list_node([{l1}]), to_list_node([{l2}])))"
    python2: "list_node_to_array(Solution().addTwoNumbers(to_list_node([{l1}]), to_list_node([{l2}])))"
    kotlin: "listNodeToArray(Solution().addTwoNumbers(toListNode(intArrayOf({l1})), toListNode(intArrayOf({l2}))))"
    java: "ListNode.listNodeToArray(new Solution().addTwoNumbers(ListNode.toListNode(new int[]{ {l1} }), ListNode.toListNode(new int[]{ {l2} })))"
    go: "listNodeToArray(addTwoNumbers(toListNode([]int{ {l1} }), toListNode([]int{ {l2} })))"
    dart: "list_node_to_array(Solution().addTwoNumbers(to_list_node([{l1}]), to_list_node([{l2}])))"
    swift: "list_node_to_array(Solution().addTwoNumbers(to_list_node([{l1}]), to_list_node([{l2}])))"
    ruby: "list_node_to_array(add_two_numbers(to_list_node([{l1}]), to_list_node([{l2}])))"

tests:
  - name: "ex1"
    in:
      l1: [2, 4, 3]
      l2: [5, 6, 4]
    out: [7, 0, 8]
```

---

### Binary Tree (`TreeNode`)

Each runtime provides helpers to convert between level-order (BFS) arrays and `TreeNode`. Use them directly in `call` templates.

Trees are represented as arrays in LeetCode standard level-order format. `null` marks an absent child and is required to preserve the structure of the tree. Trailing `null` values - those appearing after the last non-null element - are stripped.

> [!IMPORTANT]
> This is the **compressed BFS format**, not a heap/array-indexed format. `null` nodes do **not** occupy child slots in the array - only non-null nodes have their two children listed next.
>
> ```
> # ✅ Correct - left chain of depth 4:
> [1, 2, null, 3, null, 4]
>
> # ❌ Wrong - heap-style with extra nulls reserved for the absent subtree of root's right child:
> [1, 2, null, 3, null, null, null, 4]
> ```
>
> In the incorrect example, the parser consumes the two extra `null`s as children of node `3`, and never reaches `4`.

**Example - problem 104 "Maximum Depth of Binary Tree":**

```yaml
entry:
  id: 104
  title: "maximum-depth-of-binary-tree"
  call:
    cpp: "Solution().maxDepth(toTreeNode(lv(vector<optional<int>>{ {root} })))"
    rust: "Solution::max_depth(TreeNode::to_tree_node(vec![{root}]))"
    python3: "Solution().maxDepth(to_tree_node([{root}]))"
    python2: "Solution().maxDepth(to_tree_node([{root}]))"
    ruby: "Solution.new.max_depth(to_tree_node([{root}]))"
    java: "new Solution().maxDepth(TreeNode.toTreeNode(new Integer[]{ {root} }))"
    kotlin: "Solution().maxDepth(toTreeNode(arrayOf({root})))"
    go: "maxDepth(toTreeNode([]interface{}{ {root} }))"
    dart: "Solution().maxDepth(to_tree_node([{root}]))"
    swift: "Solution().maxDepth(to_tree_node([{root}]))"

tests:
  - name: "ex1"
    in:
      root: [3, 9, 20, null, null, 15, 7]
    out: 3

  - name: "ex2"
    in:
      root: [1, null, 2]
    out: 2
```

When the solution returns a `TreeNode` (e.g. _Invert Binary Tree_), wrap the result with the serializer so it can be compared as a plain array:

```yaml
entry:
  id: 226
  title: "invert-binary-tree"
  call:
    cpp: "treeNodeToArray(Solution().invertTree(toTreeNode(lv(vector<optional<int>>{ {root} }))))"
    rust: "TreeNode::tree_node_to_array(Solution::invert_tree(TreeNode::to_tree_node(vec![{root}])))"
    python3: "tree_node_to_array(Solution().invertTree(to_tree_node([{root}])))"
    python2: "tree_node_to_array(Solution().invertTree(to_tree_node([{root}])))"
    ruby: "tree_node_to_array(Solution.new.invert_tree(to_tree_node([{root}])))"
    java: "TreeNode.treeNodeToArray(new Solution().invertTree(TreeNode.toTreeNode(new Integer[]{ {root} })))"
    kotlin: "treeNodeToArray(Solution().invertTree(toTreeNode(arrayOf({root}))))"
    go: "treeNodeToArray(invertTree(toTreeNode([]interface{}{ {root} })))"
    dart: "tree_node_to_array(Solution().invertTree(to_tree_node([{root}])))"
    swift: "tree_node_to_array(Solution().invertTree(to_tree_node([{root}])))"

tests:
  - name: "ex1"
    in:
      root: [4, 2, 7, 1, 3, 6, 9]
    out: [4, 7, 2, 9, 6, 3, 1]
```
