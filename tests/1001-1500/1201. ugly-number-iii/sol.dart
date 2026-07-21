class Solution {
  int nthUglyNumber(int n, int a, int b, int c) {
    int gcd(int x, int y) {
      while (y != 0) {
        int temp = y;
        y = x % y;
        x = temp;
      }
      return x;
    }
    
    int lcm(int x, int y) {
      return x * y ~/ gcd(x, y);
    }
    
    int ab = lcm(a, b);
    int ac = lcm(a, c);
    int bc = lcm(b, c);
    int abc = lcm(ab, c);
    
    int left = 1;
    int right = 2000000000;
    
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      int cnt = mid ~/ a + mid ~/ b + mid ~/ c -
                mid ~/ ab - mid ~/ ac - mid ~/ bc +
                mid ~/ abc;
      if (cnt >= n) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }
    
    return left;
  }
}
