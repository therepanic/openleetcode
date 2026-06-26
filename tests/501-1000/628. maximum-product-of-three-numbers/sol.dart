class Solution {
  int maximumProduct(List<int> nums) {
    nums.sort();
    int n = nums.length;
    int a = nums[n-1] * nums[n-2] * nums[n-3];
    int b = nums[n-1] * nums[0] * nums[1];
    return a > b ? a : b;
  }
}
