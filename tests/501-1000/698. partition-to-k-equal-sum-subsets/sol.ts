function canPartitionKSubsets(nums: number[], k: number): boolean {
  const total = nums.reduce((a, b) => a + b, 0);
  if (total % k !== 0) return false;
  const target = total / k;
  nums.sort((a, b) => b - a);
  if (nums[0] > target) return false;
  const n = nums.length;
  const memo: Map<number, boolean> = new Map();

  const dfs = (used: number, curr: number): boolean => {
    if (used === (1 << n) - 1) return true;
    const key = (used << 10) | curr;
    if (memo.has(key)) return memo.get(key)!;
    for (let i = 0; i < n; i++) {
      if (((used >> i) & 1) === 0 && curr + nums[i] <= target) {
        const newCurr = curr + nums[i];
        const nxt = newCurr === target ? 0 : newCurr;
        if (dfs(used | (1 << i), nxt)) {
          memo.set(key, true);
          return true;
        }
      }
    }
    memo.set(key, false);
    return false;
  };

  return dfs(0, 0);
}
