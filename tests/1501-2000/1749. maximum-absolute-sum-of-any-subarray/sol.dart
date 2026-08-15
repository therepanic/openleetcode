class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int prefixSum = 0;
    int minPrefixSum = 0;
    int maxPrefixSum = 0;
    int maxAbsoluteSum = 0;

    for (int num in nums) {
      prefixSum += num;
      
      maxAbsoluteSum = max(maxAbsoluteSum, (prefixSum - minPrefixSum).abs());
      maxAbsoluteSum = max(maxAbsoluteSum, (prefixSum - maxPrefixSum).abs());
      
      minPrefixSum = min(minPrefixSum, prefixSum);
      maxPrefixSum = max(maxPrefixSum, prefixSum);
    }

    return maxAbsoluteSum;
  }
}
