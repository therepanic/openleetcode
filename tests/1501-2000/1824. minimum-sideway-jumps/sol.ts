function minSideJumps(obstacles: number[]): number {
  const INF = Number.MAX_SAFE_INTEGER / 2;
  let dp: number[] = [1, 0, 1];
  for (let i = 1; i < obstacles.length; i++) {
    const obs = obstacles[i];
    for (let j = 0; j < 3; j++) {
      if (obs === j + 1) dp[j] = INF;
    }
    for (let j = 0; j < 3; j++) {
      if (obs !== j + 1) {
        dp[j] = Math.min(dp[j], Math.min(dp[(j + 1) % 3], dp[(j + 2) % 3]) + 1);
      }
    }
  }
  return Math.min(...dp);
}
