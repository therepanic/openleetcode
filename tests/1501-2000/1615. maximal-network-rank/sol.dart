class Solution {
  int maximalNetworkRank(int n, List<List<int>> roads) {
    List<List<int>> a = List.generate(n, (_) => List.filled(n, 0));
    for (final road in roads) {
      a[road[0]][road[1]] = 1;
      a[road[1]][road[0]] = 1;
    }
    
    List<int> d = List.generate(n, (i) => a[i].reduce((x, y) => x + y));
    
    List<List<int>> rank = List.generate(n, (_) => List.filled(n, -1));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i != j) {
          rank[i][j] = d[i] + d[j] - a[i][j];
        }
      }
    }
    
    int max = -1;
    for (final row in rank) {
      for (final val in row) {
        if (val > max) max = val;
      }
    }
    return max;
  }
}
