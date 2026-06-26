function findMinDifference(timePoints: string[]): number {
  const times: number[] = timePoints
    .map((t) => {
      const [h, m] = t.split(":").map(Number);
      return h * 60 + m;
    })
    .sort((a, b) => a - b);
  let minDiff = Infinity;
  for (let i = 1; i < times.length; i++) {
    minDiff = Math.min(minDiff, times[i] - times[i - 1]);
  }
  minDiff = Math.min(minDiff, 1440 + times[0] - times[times.length - 1]);
  return minDiff;
}
