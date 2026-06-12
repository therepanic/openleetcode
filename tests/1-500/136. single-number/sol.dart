class Solution {
  int singleNumber(List<int> nums) {
    var result = 0;
    for (final num in nums) result ^= num;
    return result;
  }
}
