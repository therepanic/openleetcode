function minSumOfLengths(arr: number[], target: number): number {
  const n = arr.length;
  const bestLeft: number[] = new Array(n).fill(n);
  let minTotal = Number.MAX_SAFE_INTEGER;
  let left = 0;
  let curr = 0;
  for (let right = 0; right < n; right++) {
    curr += arr[right];
    while (curr > target) {
      curr -= arr[left];
      left++;
    }
    if (curr === target) {
      const length = right - left + 1;
      if (right > 0) {
        bestLeft[right] = Math.min(bestLeft[right - 1], length);
      } else {
        bestLeft[right] = length;
      }
      if (left > 0 && bestLeft[left - 1] !== n) {
        minTotal = Math.min(minTotal, bestLeft[left - 1] + length);
      }
    } else {
      if (right > 0) {
        bestLeft[right] = bestLeft[right - 1];
      }
    }
  }
  return minTotal === Number.MAX_SAFE_INTEGER ? -1 : minTotal;
}
