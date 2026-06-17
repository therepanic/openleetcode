class Solution {
  int wiggleMaxLength(List<int> nums) {
    if (nums.length < 2) return nums.length;

    int up = 1, down = 1;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        up = down + 1;
      } else if (nums[i] < nums[i - 1]) {
        down = up + 1;
      }
    }

    return up > down ? up : down;
  }
}
