function peakIndexInMountainArray(arr: number[]): number {
  let l = 0,
    r = arr.length - 1;
  while (l < r) {
    const mid = Math.floor((l + r) / 2);
    if (arr[mid] < arr[mid + 1]) {
      l = mid + 1;
    } else {
      r = mid;
    }
  }
  return l;
}
