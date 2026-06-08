class Solution {
  int reverse(int x) {
    var sign = x < 0 ? -1 : 1;
    var num = x.abs();
    var res = 0;

    while (num > 0) {
      res = res * 10 + num % 10;
      num ~/= 10;
    }

    res *= sign;
    if (res < -2147483648 || res > 2147483647) {
      return 0;
    }
    return res;
  }
}
