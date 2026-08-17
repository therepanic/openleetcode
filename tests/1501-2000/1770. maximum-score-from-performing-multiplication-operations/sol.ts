function maximumScore(nums: number[], multipliers: number[]): number {
  const m = multipliers.length;
  const dp: (number | null)[][] = Array.from({ length: m + 1 }, () =>
    Array(m + 1).fill(null),
  );

  function f(i: number, j: number): number {
    const k = i + j;
    if (k === m) return 0;
    if (dp[i][j] !== null) return dp[i][j]!;

    const back = multipliers[k] * nums[nums.length - 1 - j] + f(i, j + 1);
    const front = multipliers[k] * nums[i] + f(i + 1, j);
    const result = Math.max(front, back);
    dp[i][j] = result;
    return result;
  }

  return f(0, 0);
}
