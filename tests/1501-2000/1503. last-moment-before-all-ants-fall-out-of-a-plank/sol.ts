function getLastMoment(n: number, left: number[], right: number[]): number {
  let maxVal = 0;
  for (const value of left) {
    maxVal = Math.max(value, maxVal);
  }
  for (const value of right) {
    maxVal = Math.max(n - value, maxVal);
  }
  return maxVal;
}
