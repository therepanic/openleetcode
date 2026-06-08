class Solution {
  bool isPalindrome(int x) {
    if (x < 0) {
      return false;
    }

    var rev = 0;
    var num = x;
    while (num != 0) {
      rev = rev * 10 + num % 10;
      num ~/= 10;
    }
    return rev == x;
  }
}
