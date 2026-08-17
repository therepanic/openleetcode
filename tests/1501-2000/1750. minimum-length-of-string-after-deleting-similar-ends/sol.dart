class Solution {
  int minimumLength(String s) {
    int left = 0;
    int right = s.length - 1;
    while (left < right && s[left] == s[right]) {
      String ch = s[left];
      while (left <= right && s[left] == ch) {
        left++;
      }
      while (left <= right && s[right] == ch) {
        right--;
      }
    }
    return (right - left + 1) < 0 ? 0 : right - left + 1;
  }
}
