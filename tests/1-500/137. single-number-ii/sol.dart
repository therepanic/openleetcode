class Solution {
  int singleNumber(List<int> nums) {
    var totalSum = 0;
    final seen = <int>{};
    for (final num in nums) {
      totalSum += num;
      seen.add(num);
    }
    var uniqueSum = 0;
    for (final num in seen) {
      uniqueSum += num;
    }
    final numerator = 3 * uniqueSum - totalSum;
    return numerator >> 1;
  }
}
