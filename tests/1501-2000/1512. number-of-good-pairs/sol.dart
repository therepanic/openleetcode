class Solution {
  int numIdenticalPairs(List<int> nums) {
    var pairs = <int, int>{};
    int count = 0;
    for (var num in nums) {
      if (pairs.containsKey(num)) {
        count += pairs[num]!;
      }
      pairs[num] = (pairs[num] ?? 0) + 1;
    }
    return count;
  }
}
