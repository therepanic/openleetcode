class Solution {
  int majorityElement(List<int> nums) {
    int candidate = 0;
    int count = 0;
    for (final num in nums) {
      if (count == 0) {
        candidate = num;
      }
      count += num == candidate ? 1 : -1;
    }
    return candidate;
  }
}
