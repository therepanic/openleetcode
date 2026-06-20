class Solution {
  int numberOfArithmeticSlices(List<int> nums) {
    int c = 0;
    int t = 2;
    for (int i = 1; i < nums.length - 1; i++) {
      if (nums[i-1] - nums[i] == nums[i] - nums[i+1]) {
        t++;
      } else {
        t = 2;
      }
      c += t - 2;
    }
    return c;
  }
}
