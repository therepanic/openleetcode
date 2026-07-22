class Solution {
  int minFlips(int a, int b, int c) {
    int flips = 0;
    while (a != 0 || b != 0 || c != 0) {
      int abit = a & 1;
      int bbit = b & 1;
      int cbit = c & 1;

      if (cbit == 0) {
        flips += abit + bbit;
      } else if ((abit | bbit) == 0) {
        flips++;
      }

      a >>= 1;
      b >>= 1;
      c >>= 1;
    }
    return flips;
  }
}
