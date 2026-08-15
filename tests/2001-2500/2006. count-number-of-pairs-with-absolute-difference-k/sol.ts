function countKDifference(nums: number[], k: number): number {
  const c: Map<number, number> = new Map();
  for (const num of nums) {
    c.set(num, (c.get(num) || 0) + 1);
  }
  let ans = 0;
  c.forEach((cnt, x) => {
    ans += cnt * (c.get(x + k) || 0);
  });
  return ans;
}
