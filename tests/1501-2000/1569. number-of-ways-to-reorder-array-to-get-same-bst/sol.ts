function numOfWays(nums: number[]): number {
  const MOD = 1000000007n;
  const n = nums.length;

  const nCr: bigint[][] = Array.from({ length: n + 1 }, () =>
    new Array<bigint>(n + 1).fill(0n),
  );
  for (let i = 0; i <= n; i++) {
    nCr[i][0] = nCr[i][i] = 1n;
    for (let j = 1; j < i; j++) {
      nCr[i][j] = (nCr[i - 1][j - 1] + nCr[i - 1][j]) % MOD;
    }
  }

  const dfs = (arr: number[]): bigint => {
    if (arr.length <= 2) return 1n;
    const root = arr[0];
    const left = arr.slice(1).filter((x) => x < root);
    const right = arr.slice(1).filter((x) => x > root);
    const leftWays = dfs(left);
    const rightWays = dfs(right);
    const L = left.length,
      R = right.length;
    return (((nCr[L + R][L] * leftWays) % MOD) * rightWays) % MOD;
  };

  return Number((dfs(nums) - 1n + MOD) % MOD);
}
