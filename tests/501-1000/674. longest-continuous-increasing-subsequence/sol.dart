class Solution {
  int findLengthOfLCIS(List<int> nums) {
    int ptr1 = 0, ptr2 = 1;
    int n = nums.length;
    if (n == 0) return 0;
    int maxLenSubseq = 1;
    while (ptr2 < n) {
      while (ptr2 < n && nums[ptr2] > nums[ptr2 - 1]) {
        ptr2++;
      }
      maxLenSubseq = maxLenSubseq > ptr2 - ptr1 ? maxLenSubseq : ptr2 - ptr1;
      ptr1 = ptr2;
      ptr2++;
    }
    return maxLenSubseq;
  }
}
