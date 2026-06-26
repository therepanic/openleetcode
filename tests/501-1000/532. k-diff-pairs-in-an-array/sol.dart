class Solution {
  int findPairs(List<int> nums, int k) {
    if (k < 0) return 0;
    int count = 0;
    var numCounts = <int, int>{};
    for (var num in nums) {
      numCounts[num] = (numCounts[num] ?? 0) + 1;
    }
    for (var entry in numCounts.entries) {
      int num = entry.key;
      if (k == 0) {
        if (entry.value >= 2) count++;
      } else {
        if (numCounts.containsKey(num + k)) count++;
      }
    }
    return count;
  }
}
