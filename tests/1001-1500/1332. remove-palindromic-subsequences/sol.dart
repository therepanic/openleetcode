class Solution {
  int removePalindromeSub(String s) {
    return s == s.split('').reversed.join('') ? 1 : 2;
  }
}
