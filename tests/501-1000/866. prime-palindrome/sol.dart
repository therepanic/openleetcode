import 'dart:math' as math;

class Solution {
  int primePalindrome(int n) {
    bool isPrime(int num) {
      if (num < 2) return false;
      if (num % 2 == 0) return num == 2;
      for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
      }
      return true;
    }

    if (n >= 8 && n <= 11) return 11;

    while (true) {
      String s = n.toString();
      if (s.length % 2 == 0 && n > 11) {
        n = (math.pow(10, s.length)).toInt() + 1;
        continue;
      }
      if (s == s.split('').reversed.join() && isPrime(n)) {
        return n;
      }
      n++;
      if (n > 2 && n % 2 == 0) n++;
    }
  }
}
