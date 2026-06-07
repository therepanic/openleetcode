function findMedianSortedArrays(nums1: number[], nums2: number[]): number {
  if (nums1.length > nums2.length) {
    return findMedianSortedArrays(nums2, nums1);
  }

  const m = nums1.length;
  const n = nums2.length;
  const totalLeft = Math.floor((m + n + 1) / 2);
  let left = 0;
  let right = m;

  while (left <= right) {
    const i = Math.floor((left + right) / 2);
    const j = totalLeft - i;

    const maxLeft1 = i === 0 ? -2147483648 : nums1[i - 1];
    const minRight1 = i === m ? 2147483647 : nums1[i];
    const maxLeft2 = j === 0 ? -2147483648 : nums2[j - 1];
    const minRight2 = j === n ? 2147483647 : nums2[j];

    if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
      const leftMax = Math.max(maxLeft1, maxLeft2);
      if (((m + n) & 1) === 1) {
        return leftMax;
      }
      const rightMin = Math.min(minRight1, minRight2);
      return (leftMax + rightMin) / 2.0;
    }

    if (maxLeft1 > minRight2) {
      right = i - 1;
    } else {
      left = i + 1;
    }
  }

  return 0.0;
}
