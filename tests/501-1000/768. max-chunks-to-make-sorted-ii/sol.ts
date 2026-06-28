function maxChunksToSorted(arr: number[]): number {
  const n = arr.length;
  const minRight: number[] = new Array(n);
  let currentMin = Infinity;
  for (let i = n - 1; i >= 0; i--) {
    if (arr[i] < currentMin) {
      currentMin = arr[i];
    }
    minRight[i] = currentMin;
  }

  let chunks = 0;
  let currentMax = -Infinity;
  for (let i = 0; i < n - 1; i++) {
    if (arr[i] > currentMax) {
      currentMax = arr[i];
    }
    if (currentMax <= minRight[i + 1]) {
      chunks++;
    }
  }
  return chunks + 1;
}
