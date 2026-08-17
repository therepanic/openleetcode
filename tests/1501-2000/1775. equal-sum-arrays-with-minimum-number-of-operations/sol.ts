function minOperations(nums1: number[], nums2: number[]): number {
  const x = nums1.reduce((a, b) => a + b, 0);
  const y = nums2.reduce((a, b) => a + b, 0);
  if (x === y) return 0;
  if (x < y) {
    if (6 * nums1.length < nums2.length) return -1;
    const gains = nums1.map((v) => 6 - v).concat(nums2.map((v) => v - 1));
    gains.sort((a, b) => b - a);
    let diff = y - x;
    let ops = 0;
    for (const g of gains) {
      if (diff <= 0) break;
      diff -= g;
      ops++;
    }
    return diff <= 0 ? ops : -1;
  } else {
    if (6 * nums2.length < nums1.length) return -1;
    const gains = nums1.map((v) => v - 1).concat(nums2.map((v) => 6 - v));
    gains.sort((a, b) => b - a);
    let diff = x - y;
    let ops = 0;
    for (const g of gains) {
      if (diff <= 0) break;
      diff -= g;
      ops++;
    }
    return diff <= 0 ? ops : -1;
  }
}
