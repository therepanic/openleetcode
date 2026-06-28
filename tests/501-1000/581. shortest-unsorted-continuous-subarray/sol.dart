class Solution {
  int findUnsortedSubarray(List<int> nums) {
    List<int> sortedNums = List.from(nums)..sort();
    int start = nums.length, end = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != sortedNums[i]) {
        start = start < i ? start : i;
        end = end > i ? end : i;
      }
    }

    return end - start >= 0 ? end - start + 1 : 0;
  }
}
