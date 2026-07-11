class Solution {
  bool rotateString(String s, String goal) {
    return s.length == goal.length && (s + s).contains(goal);
  }
}
