function minimumIncompatibility(nums: number[], k: number): number {
  const n = nums.length;
  const sz = n / k;

  const counts = new Map<number, number>();
  for (const num of nums) {
    counts.set(num, (counts.get(num) || 0) + 1);
  }
  for (const v of counts.values()) {
    if (v > k) return -1;
  }

  nums.sort((a, b) => a - b);

  const validSubsets = new Map<number, number>();
  for (let mask = 0; mask < 1 << n; mask++) {
    if (bitCount(mask) === sz) {
      const subset: number[] = [];
      for (let i = 0; i < n; i++) {
        if ((mask >> i) & 1) {
          subset.push(nums[i]);
        }
      }
      if (new Set(subset).size === sz) {
        validSubsets.set(mask, Math.max(...subset) - Math.min(...subset));
      }
    }
  }

  const memo = new Map<number, number>();
  function solve(remainingMask: number): number {
    if (remainingMask === 0) return 0;
    if (memo.has(remainingMask)) return memo.get(remainingMask)!;

    const firstElement =
      (remainingMask & -remainingMask).toString(2).length - 1;
    let res = Number.MAX_SAFE_INTEGER;

    for (const [mask, cost] of validSubsets) {
      if (
        (mask & remainingMask) === mask &&
        ((mask >> firstElement) & 1) === 1
      ) {
        const next = solve(remainingMask ^ mask);
        if (next !== Number.MAX_SAFE_INTEGER) {
          res = Math.min(res, cost + next);
        }
      }
    }

    memo.set(remainingMask, res);
    return res;
  }

  const ans = solve((1 << n) - 1);
  return ans === Number.MAX_SAFE_INTEGER ? -1 : ans;
}

function bitCount(x: number): number {
  let count = 0;
  while (x > 0) {
    count += x & 1;
    x >>= 1;
  }
  return count;
}
