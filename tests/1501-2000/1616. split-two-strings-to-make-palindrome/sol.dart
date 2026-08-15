class Solution {
  bool checkPalindromeFormation(String a, String b) {
    return check(a, b) || check(b, a);
  }

  bool check(String a, String b) {
    int i = 0, j = a.length - 1;
    while (i < j && a[i] == b[j]) {
      i++;
      j--;
    }
    return isPalindrome(a.substring(i, j + 1)) || isPalindrome(b.substring(i, j + 1));
  }

  bool isPalindrome(String s) => s == s.split('').reversed.join();
}
