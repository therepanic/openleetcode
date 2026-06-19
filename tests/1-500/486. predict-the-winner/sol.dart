class Solution {
  bool predictTheWinner(List<int> nums) {
    int helper(int left, int right) {
      if (left == right) {
        return nums[left];
      }
      return [nums[left] - helper(left + 1, right), nums[right] - helper(left, right - 1)]
          .reduce((a, b) => a > b ? a : b);
    }
    return helper(0, nums.length - 1) >= 0;
  }
}
