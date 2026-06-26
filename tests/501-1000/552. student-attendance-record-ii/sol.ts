function checkRecord(n: number): number {
  const mod = 1000000007;
  let dp: number[][] = [
    [1, 0, 0],
    [0, 0, 0],
  ];

  for (let i = 0; i < n; i++) {
    let ndp: number[][] = [
      [0, 0, 0],
      [0, 0, 0],
    ];
    for (let absences = 0; absences < 2; absences++) {
      for (let lates = 0; lates < 3; lates++) {
        const cur = dp[absences][lates];
        if (cur === 0) continue;
        ndp[absences][0] = (ndp[absences][0] + cur) % mod;
        if (absences === 0) {
          ndp[1][0] = (ndp[1][0] + cur) % mod;
        }
        if (lates < 2) {
          ndp[absences][lates + 1] = (ndp[absences][lates + 1] + cur) % mod;
        }
      }
    }
    dp = ndp;
  }

  let total = 0;
  for (const row of dp) {
    for (const value of row) {
      total = (total + value) % mod;
    }
  }
  return total;
}
