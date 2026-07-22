function numOfSubarrays(arr: number[], k: number, threshold: number): number {
  let res = 0;
  let left = 0;
  let total = 0;
  for (let right = 0; right < arr.length; right++) {
    total += arr[right];
    if (right - left + 1 === k) {
      if (Math.floor(total / k) >= threshold) {
        res++;
      }
      total -= arr[left];
      left++;
    }
  }
  return res;
}
