function numWays(words: string[], target: string): number {
  const MOD = 1000000007;
  const m = words[0].length;
  const A: number[][] = Array(m)
    .fill(0)
    .map(() => Array(26).fill(0));
  for (const word of words) {
    for (let j = 0; j < m; j++) {
      A[j][word.charCodeAt(j) - 97]++;
    }
  }
  const dp: number[][] = Array(m)
    .fill(0)
    .map(() => Array(target.length).fill(-1));
  const targetArr = Array.from(target);

  const F = (i: number, j: number): number => {
    if (j === target.length) return 1;
    if (i === m) return 0;
    if (dp[i][j] !== -1) return dp[i][j];

    let count = F(i + 1, j) % MOD;
    count =
      (count +
        ((A[i][targetArr[j].charCodeAt(0) - 97] * F(i + 1, j + 1)) % MOD)) %
      MOD;
    dp[i][j] = count;
    return count;
  };
  return F(0, 0);
}
