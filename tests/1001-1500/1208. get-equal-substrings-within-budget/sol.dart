class Solution {
  int equalSubstring(String s, String t, int maxCost) {
    int ans = 0, cost = 0, left = 0;
    for (int right = 0; right < s.length; right++) {
      cost += (s.codeUnitAt(right) - t.codeUnitAt(right)).abs();
      while (cost > maxCost) {
        cost -= (s.codeUnitAt(left) - t.codeUnitAt(left)).abs();
        left++;
      }
      int size = right - left + 1;
      if (size > ans) {
        ans = size;
      }
    }
    return ans;
  }
}
