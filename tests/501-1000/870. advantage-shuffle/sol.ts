function advantageCount(nums1: number[], nums2: number[]): number[] {
  const n = nums1.length;
  nums1.sort((a, b) => a - b);

  const nums2Sorted: [number, number][] = nums2.map((num, idx) => [num, idx]);
  nums2Sorted.sort((a, b) => a[0] - b[0]);

  const res: number[] = new Array(n).fill(0);
  let left = 0,
    right = n - 1;

  for (let i = n - 1; i >= 0; i--) {
    if (nums1[right] > nums2Sorted[i][0]) {
      res[nums2Sorted[i][1]] = nums1[right];
      right--;
    } else {
      res[nums2Sorted[i][1]] = nums1[left];
      left++;
    }
  }

  return res;
}
