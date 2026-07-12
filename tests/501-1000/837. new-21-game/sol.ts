function new21Game(n: number, k: number, maxPts: number): number {
  if (k === 0 || n >= k - 1 + maxPts) {
    return 1.0;
  }

  const dp: number[] = new Array(maxPts).fill(0.0);
  dp[0] = 1.0;

  let windowSum = 1.0;
  let result = 0.0;

  for (let i = 1; i <= n; i++) {
    const prob = windowSum / maxPts;

    if (i < k) {
      windowSum += prob;
    } else {
      result += prob;
    }

    if (i >= maxPts) {
      windowSum -= dp[i % maxPts];
    }

    dp[i % maxPts] = prob;
  }

  return result;
}
