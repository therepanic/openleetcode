class Solution {
  double myPow(double x, int n) {
    var exp = n;
    if (exp < 0) {
      x = 1.0 / x;
      exp = -exp;
    }

    var ans = 1.0;
    while (exp > 0) {
      if (exp.isOdd) ans *= x;
      x *= x;
      exp ~/= 2;
    }
    return ans;
  }
}
