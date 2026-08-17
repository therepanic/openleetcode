function countRoutes(
  locations: number[],
  start: number,
  finish: number,
  fuel: number,
): number {
  const MOD = 1000000007;
  const n = locations.length;
  const dp: number[][] = Array.from({ length: n }, () =>
    new Array(fuel + 1).fill(0),
  );
  for (let city = 0; city < n; city++) {
    dp[city][0] = city === finish ? 1 : 0;
  }
  for (let left = 1; left <= fuel; left++) {
    for (let city = 0; city < n; city++) {
      let total = city === finish ? 1 : 0;
      for (let nxt = 0; nxt < n; nxt++) {
        if (nxt !== city) {
          const cost = Math.abs(locations[nxt] - locations[city]);
          if (cost <= left) {
            total = (total + dp[nxt][left - cost]) % MOD;
          }
        }
      }
      dp[city][left] = total;
    }
  }
  return dp[start][fuel];
}
