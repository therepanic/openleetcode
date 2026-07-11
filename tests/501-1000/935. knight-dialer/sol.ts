function knightDialer(n: number): number {
  if (n === 1) {
    return 10;
  }

  let dp: number[] = new Array(10).fill(1);
  const mapping: number[][] = [
    [4, 6],
    [6, 8],
    [7, 9],
    [4, 8],
    [0, 3, 9],
    [],
    [0, 1, 7],
    [2, 6],
    [1, 3],
    [2, 4],
  ];

  const MOD = 1000000007;

  for (let step = 0; step < n - 1; step++) {
    const newDp: number[] = new Array(10).fill(0);
    for (let i = 0; i < 10; i++) {
      for (const digit of mapping[i]) {
        newDp[digit] = (newDp[digit] + dp[i]) % MOD;
      }
    }
    dp = newDp;
  }

  let sum = 0;
  for (const val of dp) {
    sum = (sum + val) % MOD;
  }
  return sum;
}
