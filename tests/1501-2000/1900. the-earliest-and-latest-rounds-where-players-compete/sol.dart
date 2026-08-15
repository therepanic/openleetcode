class Solution {
  List<int> earliestAndLatest(int n, int firstPlayer, int secondPlayer) {
    return dfs(n, firstPlayer, secondPlayer);
  }
  
  List<int> dfs(int n, int p1, int p2) {
    if (p1 + p2 == n + 1) return [1, 1];
    if (p1 > p2) { int t = p1; p1 = p2; p2 = t; }
    if (n <= 4) return [2, 2];
    
    int m = (n + 1) ~/ 2;
    int minR = 1 << 30;
    int maxR = -minR;
    
    if (p1 - 1 > n - p2) {
      int t = n + 1 - p1;
      p1 = n + 1 - p2;
      p2 = t;
    }
    
    if (p2 * 2 <= n + 1) {
      int a = p1 - 1;
      int b = p2 - p1 - 1;
      for (int i = 0; i <= a; i++) {
        for (int j = 0; j <= b; j++) {
          List<int> r = dfs(m, i + 1, i + j + 2);
          minR = min(minR, r[0] + 1);
          maxR = max(maxR, r[1] + 1);
        }
      }
    } else {
      int p4 = n + 1 - p2;
      int a = p1 - 1;
      int b = p4 - p1 - 1;
      int c = p2 - p4 - 1;
      for (int i = 0; i <= a; i++) {
        for (int j = 0; j <= b; j++) {
          int offset = i + j + 1 + (c + 1) ~/ 2 + 1;
          List<int> r = dfs(m, i + 1, offset);
          minR = min(minR, r[0] + 1);
          maxR = max(maxR, r[1] + 1);
        }
      }
    }
    
    return [minR, maxR];
  }
  
  int min(int a, int b) => a < b ? a : b;
  int max(int a, int b) => a > b ? a : b;
}
