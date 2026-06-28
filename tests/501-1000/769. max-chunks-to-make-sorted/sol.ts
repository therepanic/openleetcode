function maxChunksToSorted(arr: number[]): number {
  let ans = 0;
  let prevMax = 0;
  for (let idx = 0; idx < arr.length; idx++) {
    prevMax = Math.max(prevMax, arr[idx]);
    if (prevMax === idx) {
      ans++;
    }
  }
  return ans;
}
