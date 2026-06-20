class Solution {
  int longestConsecutive(List<int> nums) {
    final seen = nums.toSet();
    var best = 0;
    for (final num in seen) {
      if (seen.contains(num - 1)) continue;
      var current = num;
      var streak = 1;
      while (seen.contains(current + 1)) { current++; streak++; }
      if (streak > best) best = streak;
    }
    return best;
  }
}
