class Solution {
  int subsetXORSum(List<int> nums) {
    int total = 0;
    for (int num in nums) {
      total |= num;
    }
    return total * (1 << (nums.length - 1));
  }
}
