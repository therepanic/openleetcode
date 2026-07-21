function isPossibleDivide(nums: number[], k: number): boolean {
  if (nums.length % k !== 0) return false;
  const count = new Map<number, number>();
  for (const num of nums) {
    count.set(num, (count.get(num) || 0) + 1);
  }
  nums.sort((a, b) => a - b);
  for (const num of nums) {
    if (count.get(num) === 0) continue;
    for (let i = 0; i < k; i++) {
      const cur = num + i;
      if ((count.get(cur) || 0) === 0) return false;
      count.set(cur, count.get(cur)! - 1);
    }
  }
  return true;
}
