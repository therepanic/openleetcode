function findShortestSubArray(nums: number[]): number {
  const left: Map<number, number> = new Map();
  const right: Map<number, number> = new Map();
  const count: Map<number, number> = new Map();

  for (let i = 0; i < nums.length; i++) {
    const x = nums[i];
    if (!left.has(x)) {
      left.set(x, i);
    }
    right.set(x, i);
    count.set(x, (count.get(x) || 0) + 1);
  }

  let ans = nums.length;
  let degree = 0;
  for (const c of count.values()) {
    degree = Math.max(degree, c);
  }

  for (const [x, c] of count) {
    if (c === degree) {
      ans = Math.min(ans, right.get(x)! - left.get(x)! + 1);
    }
  }

  return ans;
}
