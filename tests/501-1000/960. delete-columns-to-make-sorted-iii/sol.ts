function minDeletionSize(strs: string[]): number {
  const m = strs[0].length;
  const dp: number[] = new Array(m).fill(1);

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < i; j++) {
      let all = true;
      for (const row of strs) {
        if (row[j] > row[i]) {
          all = false;
          break;
        }
      }
      if (all) {
        dp[i] = Math.max(dp[i], dp[j] + 1);
      }
    }
  }

  return m - Math.max(...dp);
}
