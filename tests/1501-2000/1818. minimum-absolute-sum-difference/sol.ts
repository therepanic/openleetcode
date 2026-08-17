function minAbsoluteSumDiff(nums1: number[], nums2: number[]): number {
  const MOD = 1_000_000_007;
  const n = nums1.length;
  const sortedNums1 = [...nums1].sort((a, b) => a - b);
  let total = 0;
  let maxReduction = 0;

  for (let i = 0; i < n; i++) {
    const a = nums1[i];
    const b = nums2[i];
    const currDiff = Math.abs(a - b);
    total += currDiff;

    let idx = lowerBound(sortedNums1, b);

    if (idx < n) {
      maxReduction = Math.max(
        maxReduction,
        currDiff - Math.abs(sortedNums1[idx] - b),
      );
    }
    if (idx > 0) {
      maxReduction = Math.max(
        maxReduction,
        currDiff - Math.abs(sortedNums1[idx - 1] - b),
      );
    }
  }

  return (total - maxReduction) % MOD;
}

function lowerBound(arr: number[], target: number): number {
  let low = 0,
    high = arr.length;
  while (low < high) {
    const mid = Math.floor((low + high) / 2);
    if (arr[mid] < target) low = mid + 1;
    else high = mid;
  }
  return low;
}
