function numberWays(hats: number[][]): number {
  const mod = 1_000_000_007;
  const n = hats.length;
  const likedByHat: number[][] = Array.from({ length: 41 }, () => []);
  for (let person = 0; person < n; person++) {
    for (const hat of hats[person]) {
      likedByHat[hat].push(person);
    }
  }

  let dp: number[] = new Array(1 << n).fill(0);
  dp[0] = 1;
  for (let hat = 1; hat <= 40; hat++) {
    const updated: number[] = [...dp];
    for (let mask = 0; mask < 1 << n; mask++) {
      const count = dp[mask];
      if (count === 0) continue;
      for (const person of likedByHat[hat]) {
        const personBit = 1 << person;
        if ((mask & personBit) === 0) {
          const target = mask | personBit;
          updated[target] = (updated[target] + count) % mod;
        }
      }
    }
    dp = updated;
  }
  return dp[(1 << n) - 1];
}
