class Solution {
  int tribonacci(int n) {
    int ft = 0, st = 1, tt = 1;
    for (int i = 1; i <= n; i++) {
      int frt = ft + st + tt;
      ft = st;
      st = tt;
      tt = frt;
    }
    return ft;
  }
}
