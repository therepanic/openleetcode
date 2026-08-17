function bestTeamScore(scores: number[], ages: number[]): number {
  const n = scores.length;
  const players = scores.map((s, i) => [ages[i], s]);
  players.sort((a, b) => (a[0] !== b[0] ? a[0] - b[0] : a[1] - b[1]));
  const dp = players.map((p) => p[1]);
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < i; j++) {
      if (players[j][1] <= players[i][1]) {
        dp[i] = Math.max(dp[i], dp[j] + players[i][1]);
      }
    }
  }
  return Math.max(...dp);
}
