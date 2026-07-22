function longestCommonSubsequence(text1: string, text2: string): number {
  const m = text1.length;
  const n = text2.length;
  const memo: number[][] = Array.from({ length: m }, () => Array(n).fill(-1));

  function solve(i: number, j: number): number {
    if (i >= m || j >= n) return 0;
    if (memo[i][j] !== -1) return memo[i][j];

    if (text1[i] === text2[j]) {
      memo[i][j] = 1 + solve(i + 1, j + 1);
    } else {
      memo[i][j] = Math.max(solve(i + 1, j), solve(i, j + 1));
    }
    return memo[i][j];
  }

  return solve(0, 0);
}
