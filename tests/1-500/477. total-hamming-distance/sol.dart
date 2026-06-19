class Solution {
  int totalHammingDistance(List<int> nums) {
    int total = 0;
    int n = nums.length;
    for (int i = 0; i < 32; i++) {
      int ones = 0;
      for (int num in nums) {
        ones += (num >> i) & 1;
      }
      total += ones * (n - ones);
    }
    return total;
  }
}
