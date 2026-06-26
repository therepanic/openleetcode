class Solution {
  bool checkSubarraySum(List<int> nums, int k) {
    if (nums.isEmpty) return false;

    int prefixSum = 0;
    Map<int, int> remainderMap = {0: -1};

    for (int i = 0; i < nums.length; i++) {
      prefixSum += nums[i];
      int remainder = prefixSum % k;

      if (remainderMap.containsKey(remainder)) {
        if (i - remainderMap[remainder]! > 1) return true;
      } else {
        remainderMap[remainder] = i;
      }
    }

    return false;
  }
}
