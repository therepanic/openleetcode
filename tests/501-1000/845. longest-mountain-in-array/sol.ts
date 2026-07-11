function longestMountain(arr: number[]): number {
  const n = arr.length;
  let best = 0;
  let i = 1;

  while (i < n - 1) {
    if (arr[i - 1] < arr[i] && arr[i] > arr[i + 1]) {
      let left = i - 1;
      let right = i + 1;
      while (left > 0 && arr[left - 1] < arr[left]) {
        left--;
      }
      while (right < n - 1 && arr[right] > arr[right + 1]) {
        right++;
      }
      best = Math.max(best, right - left + 1);
      i = right;
    }
    i++;
  }

  return best;
}
