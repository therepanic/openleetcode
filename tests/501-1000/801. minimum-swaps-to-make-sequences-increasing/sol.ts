function minSwap(nums1: number[], nums2: number[]): number {
  const n = nums1.length;
  let keep = 0;
  let swap = 1;

  for (let i = 1; i < n; i++) {
    const inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1];
    const cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1];

    if (inc && cross) {
      const m = Math.min(keep, swap);
      keep = m;
      swap = m + 1;
    } else if (inc) {
      swap += 1;
    } else {
      const temp = keep;
      keep = swap;
      swap = temp + 1;
    }
  }

  return Math.min(keep, swap);
}
