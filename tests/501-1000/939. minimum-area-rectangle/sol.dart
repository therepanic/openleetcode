class Solution {
  int minAreaRect(List<List<int>> points) {
    Map<int, List<int>> cols = {};
    for (var point in points) {
      int x = point[0], y = point[1];
      cols.putIfAbsent(x, () => []).add(y);
    }
    
    Map<String, int> lastX = {};
    int best = 0x7fffffffffffffff;
    List<int> sortedX = cols.keys.toList()..sort();
    
    for (int x in sortedX) {
      List<int> ys = cols[x]!..sort();
      for (int i = 0; i < ys.length; i++) {
        for (int j = i + 1; j < ys.length; j++) {
          String pair = '${ys[i]},${ys[j]}';
          if (lastX.containsKey(pair)) {
            int area = (x - lastX[pair]!) * (ys[j] - ys[i]);
            if (area < best) best = area;
          }
          lastX[pair] = x;
        }
      }
    }
    return best == 0x7fffffffffffffff ? 0 : best;
  }
}
