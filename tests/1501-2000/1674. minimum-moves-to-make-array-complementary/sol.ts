function minMoves(nums: number[], limit: number): number {
  const n = nums.length;
  const diff = new Array(2 * limit + 2).fill(0);

  for (let i = 0; i < n / 2; i++) {
    const a = nums[i];
    const b = nums[n - 1 - i];
    const low = Math.min(a, b) + 1;
    const high = Math.max(a, b) + limit;
    const total = a + b;

    diff[2] += 2;
    diff[2 * limit + 1] -= 2;

    diff[low] -= 1;
    diff[high + 1] += 1;

    diff[total] -= 1;
    diff[total + 1] += 1;
  }

  let ans = Number.MAX_SAFE_INTEGER;
  let moves = 0;
  for (let target = 2; target <= 2 * limit; target++) {
    moves += diff[target];
    ans = Math.min(ans, moves);
  }

  return ans;
}
