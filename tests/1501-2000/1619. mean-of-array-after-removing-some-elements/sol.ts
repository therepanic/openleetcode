function trimMean(arr: number[]): number {
  const n = arr.length;
  const per5 = Math.floor(0.05 * n);
  arr.sort((a, b) => a - b);
  let sum = 0;
  for (let i = per5; i < n - per5; i++) {
    sum += arr[i];
  }
  return sum / (n - per5 - per5);
}
