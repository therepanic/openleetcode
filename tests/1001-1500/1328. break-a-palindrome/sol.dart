class Solution {
  String breakPalindrome(String palindrome) {
    if (palindrome.length == 1) return "";
    List<String> chars = palindrome.split('');
    for (int i = 0; i < chars.length ~/ 2; i++) {
      if (chars[i] != 'a') {
        chars[i] = 'a';
        return chars.join('');
      }
    }
    chars[chars.length - 1] = 'b';
    return chars.join('');
  }
}
