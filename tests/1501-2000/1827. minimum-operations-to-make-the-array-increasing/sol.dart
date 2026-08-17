class Solution {
  int minOperations(List<int> nums) {
    int current = nums[0];
    int operations = 0;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] <= current) {
        current++;
        operations += current - nums[i];
      } else {
        current = nums[i];
      }
    }
    return operations;
  }
}
