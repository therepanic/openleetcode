class Solution {
  int maxIceCream(List<int> costs, int coins) {
    int xMin = costs[0];
    int xMax = costs[0];
    for (int x in costs) {
      if (x < xMin) xMin = x;
      if (x > xMax) xMax = x;
    }
    List<int> freq = List.filled(xMax + 1, 0);
    for (int x in costs) {
      freq[x]++;
      if (x < xMin) xMin = x;
    }
    int cnt = 0;
    for (int x = xMin; x <= xMax; x++) {
      int f = freq[x];
      if (f == 0) continue;
      int buy = coins ~/ x;
      if (buy > f) buy = f;
      if (buy == 0) break;
      cnt += buy;
      coins -= buy * x;
    }
    return cnt;
  }
}
