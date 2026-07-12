class Solution {
  bool buddyStrings(String s, String goal) {
    if (s.length != goal.length) return false;
    if (s == goal) {
      return s.runes.toSet().length < s.length;
    }
    List<int> diffs = [];
    for (int i = 0; i < s.length; i++) {
      if (s[i] != goal[i]) {
        diffs.add(i);
      }
    }
    return diffs.length == 2 && s[diffs[0]] == goal[diffs[1]] && s[diffs[1]] == goal[diffs[0]];
  }
}
