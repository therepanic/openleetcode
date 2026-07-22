function maxScore(cardPoints: number[], k: number): number {
  let l = 0;
  const n = cardPoints.length;
  let total = cardPoints.slice(n - k).reduce((a, b) => a + b, 0);
  let res = total;
  for (let r = n - k; r < n; r++) {
    total += cardPoints[l] - cardPoints[r];
    res = Math.max(res, total);
    l++;
  }
  return res;
}
