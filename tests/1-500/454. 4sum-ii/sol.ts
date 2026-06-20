function fourSumCount(
  nums1: number[],
  nums2: number[],
  nums3: number[],
  nums4: number[],
): number {
  const map = new Map<number, number>();
  for (const a of nums1) {
    for (const b of nums2) {
      const sum = a + b;
      map.set(sum, (map.get(sum) || 0) + 1);
    }
  }
  let count = 0;
  for (const c of nums3) {
    for (const d of nums4) {
      count += map.get(-(c + d)) || 0;
    }
  }
  return count;
}
