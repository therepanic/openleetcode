import 'dart:math' as math;

class Solution {
  int maxBuilding(int n, List<List<int>> restrictions) {
    List<List<int>> r = List.from(restrictions);
    r.add([1, 0]);
    r.sort((a, b) => a[0].compareTo(b[0]));
    int m = r.length;
    
    for (int i = 1; i < m; i++) {
      r[i][1] = math.min(r[i][1], r[i-1][1] + (r[i][0] - r[i-1][0]).abs());
    }
    
    for (int i = m - 2; i >= 0; i--) {
      r[i][1] = math.min(r[i][1], r[i+1][1] + (r[i+1][0] - r[i][0]).abs());
    }
    
    int res = 0;
    for (int i = 1; i < m; i++) {
      int peak = (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) ~/ 2;
      if (peak > res) res = peak;
    }
    
    return math.max(res, r[m-1][1] + n - r[m-1][0]);
  }
}
