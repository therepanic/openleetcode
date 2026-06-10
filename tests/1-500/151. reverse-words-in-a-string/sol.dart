class Solution {
  String reverseWords(String s) {
    final parts = s.trim().split(RegExp(r'\s+')).reversed.toList();
    return parts.join(' ');
  }
}
