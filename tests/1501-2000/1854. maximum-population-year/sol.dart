class Solution {
  int maximumPopulation(List<List<int>> logs) {
    int l = logs.length;
    List<int> a = [];
    int r = 0;
    int y = 0;
    for (var i in logs) {
      a.add(i[0]);
    }
    for (int j = 0; j < l; j++) {
      int c = 0;
      for (int k = 0; k < l; k++) {
        if (a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k) {
          c++;
        }
      }
      if (c > r) {
        r = c;
        y = a[j];
      }
      if (c == r && r > 0) {
        if (a[j] < y) {
          y = a[j];
        }
      }
    }
    if (y == 0) {
      int min = a[0];
      for (int i = 1; i < l; i++) {
        if (a[i] < min) min = a[i];
      }
      return min;
    }
    return y;
  }
}
