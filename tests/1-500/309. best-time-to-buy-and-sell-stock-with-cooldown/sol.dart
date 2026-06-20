class Solution {
  int maxProfit(List<int> prices) {
    int a = -1 << 63;
    int b = 0;
    int c = 0;
    for (int p in prices) {
      int newA = a > c - p ? a : c - p;
      int newB = a + p;
      int newC = c > b ? c : b;
      a = newA;
      b = newB;
      c = newC;
    }
    return b > c ? b : c;
  }
}
