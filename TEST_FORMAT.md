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
    python3: "..."
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

| Field    | Required | Description |
|----------|----------|-------------|
| `entry`  | ✅ | Problem metadata and per-language call templates |
| `judge`  | ✅ | Default judge for all test cases |
| `limits` | ✅ | Time and memory limits applied to every run |
| `oracle` | ✅ | Per-language checker used when a test case has no `out` field |
| `seed`   | ✅ | Global random seed (used when a test case doesn't specify its own) |
| `tests`  | ✅ | List of test cases |

---

## `entry`

```yaml
entry:
  id: 1
  title: "two-sum"
  call:
    python3: "Solution().twoSum([{nums}], {target})"
    java: "new Solution().twoSum(new int[] { {nums} }, {target})"
    go: "twoSum([]int{ {nums} }, {target})"
    # ... other languages
```

`call` templates use `{param_name}` placeholders. At runtime, placeholders are replaced with the actual values of the test case inputs by their name.

**Supported languages:** `python3`, `ruby`, `java`, `kotlin`, `go`, `dart`, `swift`

---

## `judge`

```yaml
judge:
  type: "exact"
```

| Value          | Behaviour                                                  |
|----------------|------------------------------------------------------------|
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
|---------|----------|------------------------------------------------------------------------------------------|
| `name`  | ✅ | Unique name for this test case                                                           |
| `in`    | ✅ | Map of input parameter names to values or generator specs                                |
| `out`   | ❌ | Expected output. If provided, the judge is used. If omitted, the oracle is used instead. |
| `judge` | ❌ | Overrides the suite-level judge for this case                                            |
| `call`  | ❌ | Overrides the suite-level call templates for this case                                   |
| `seed`  | ❌ | Random seed for generated inputs in this case, falls back to suite-level `seed`          |

Each value in `in` is either a plain YAML value (string, number, array, bool) or a generator spec identified by a `gen` field. They can be mixed freely.

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

| Field | Description |
|-------|-------------|
| `min` | Minimum value (inclusive) |
| `max` | Maximum value (inclusive) |

---

### `float` - Float

```yaml
{ gen: "float", min: -1.0, max: 1.0, precision: 2 }
```

Or a constant:

```yaml
3.14
```

| Field       | Description |
|-------------|-------------|
| `min`       | Minimum value (inclusive) |
| `max`       | Maximum value (inclusive) |
| `precision` | Number of decimal places |

---

### `str` - String

```yaml
{ gen: "str", len: 100000, alphabet: ['a', 'b', 'c'] }
```

Or a constant:

```yaml
"hello"
```

| Field      | Description                                                            |
|------------|------------------------------------------------------------------------|
| `len`      | Length of the string - either a constant integer or an `int` generator |
| `alphabet` | List of characters to draw from                                        |

---

### `char` - Single character

```yaml
{ gen: "char", variety: ['a', 'b', 'c'] }
```

Or a constant:

```yaml
'b'
```

| Field     | Description |
|-----------|-------------|
| `variety` | List of characters to randomly pick from |

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
distinct: false # if true, all elements are unique
sorted: false # if true, array is sorted ascending
len: { gen: "int", min: 1, max: 20 }
of: { gen: "int", min: 0, max: 9 }
```

Or a constant (written as a plain YAML array):

```yaml
[1, 2, 3]
```

| Field      | Description                                     |
|------------|-------------------------------------------------|
| `distinct` | Whether all elements must be unique             |
| `sorted`   | Whether the array must be sorted ascending      |
| `len`      | Length - constant integer or `int` generator    |
| `of`       | Generator for each element - any generator type |

Nested arrays are not supported. To work around this, define each inner array as a separate parameter and inline them manually in the `call` template:

```yaml
in:
  a: { gen: "array", distinct: false, sorted: false, len: { gen: "int", min: 1, max: 5 }, of: { gen: "int", min: 0, max: 9 } }
  b: { gen: "array", distinct: false, sorted: false, len: { gen: "int", min: 1, max: 5 }, of: { gen: "int", min: 0, max: 9 } }
```

```yaml
call:
  java: "new Solution().solve(new int[][] { new int[] { {a} }, new int[] { {b} } })"
```

---

## Full Example

```yaml
entry:
  id: 1
  title: "two-sum"
  call:
    python3: "Solution().twoSum([{nums}], {target})"
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
