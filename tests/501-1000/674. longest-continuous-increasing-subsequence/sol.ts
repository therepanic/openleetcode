function findLengthOfLCIS(nums: number[]): number {
  let ptr1 = 0,
    ptr2 = 1;
  const n = nums.length;
  if (n === 0) return 0;
  let maxLenSubseq = 1;
  while (ptr2 < n) {
    while (ptr2 < n && nums[ptr2] > nums[ptr2 - 1]) {
      ptr2++;
    }
    maxLenSubseq = Math.max(maxLenSubseq, ptr2 - ptr1);
    ptr1 = ptr2;
    ptr2++;
  }
  return maxLenSubseq;
}
