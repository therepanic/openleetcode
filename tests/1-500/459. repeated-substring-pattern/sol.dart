class Solution {
  bool repeatedSubstringPattern(String s) {
    final doubled = (s + s).substring(1, 2 * s.length - 1);
    return doubled.contains(s);
  }
}
