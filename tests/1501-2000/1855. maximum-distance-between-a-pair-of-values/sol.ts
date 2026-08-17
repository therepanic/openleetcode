function maxDistance(nums1: number[], nums2: number[]): number {
  let i = 0,
    j = 0;
  let ans = 0;
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] <= nums2[j]) {
      ans = Math.max(ans, j - i);
      j++;
    } else {
      i++;
      if (i > j) j = i;
    }
  }
  return ans;
}
