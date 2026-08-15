function scoreOfStudents(s: string, answers: number[]): number {
  const memo = new Map<string, Set<number>>();

  function fn(lo: number, hi: number): Set<number> {
    const key = `${lo},${hi}`;
    if (memo.has(key)) return memo.get(key)!;
    if (lo + 1 === hi) {
      const val = new Set<number>([parseInt(s[lo])]);
      memo.set(key, val);
      return val;
    }
    const result = new Set<number>();
    for (let mid = lo + 1; mid < hi; mid += 2) {
      for (const x of fn(lo, mid)) {
        for (const y of fn(mid + 1, hi)) {
          if (s[mid] === "+" && x + y <= 1000) {
            result.add(x + y);
          } else if (s[mid] === "*" && x * y <= 1000) {
            result.add(x * y);
          }
        }
      }
    }
    memo.set(key, result);
    return result;
  }

  // evaluate target with precedence
  const nums: number[] = [];
  const ops: string[] = [];
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c >= "0" && c <= "9") {
      nums.push(parseInt(c));
    } else if (c === "+" || c === "*") {
      while (
        ops.length > 0 &&
        precedence(ops[ops.length - 1]) >= precedence(c)
      ) {
        apply(nums, ops);
      }
      ops.push(c);
    }
  }
  while (ops.length > 0) apply(nums, ops);
  const target = nums[nums.length - 1];

  const cand = fn(0, s.length);
  let score = 0;
  for (const x of answers) {
    if (x === target) score += 5;
    else if (cand.has(x)) score += 2;
  }
  return score;
}

function precedence(c: string): number {
  return c === "*" ? 2 : 1;
}

function apply(nums: number[], ops: string[]) {
  const b = nums.pop()!;
  const a = nums.pop()!;
  const op = ops.pop()!;
  nums.push(op === "+" ? a + b : a * b);
}
