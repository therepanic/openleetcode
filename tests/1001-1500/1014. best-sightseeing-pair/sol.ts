function maxScoreSightseeingPair(values: number[]): number {
  const n = values.length;
  const suffixMax: number[] = new Array(n);
  suffixMax[n - 1] = values[n - 1] - (n - 1);

  for (let i = n - 2; i >= 0; i--) {
    suffixMax[i] = Math.max(suffixMax[i + 1], values[i] - i);
  }

  let maxScore = -Infinity;
  for (let i = 0; i < n - 1; i++) {
    maxScore = Math.max(maxScore, values[i] + i + suffixMax[i + 1]);
  }

  return maxScore;
}
