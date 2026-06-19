class Solution {
  int minMoves(List<int> nums) {
    int sum = nums.reduce((a, b) => a + b);
    int min = nums.reduce((a, b) => a < b ? a : b);
    return sum - nums.length * min;
  }
}
