class Solution {
  int removeBoxes(List<int> boxes) {
    List<List<int>> groups = [];
    int i = 0;
    while (i < boxes.length) {
      int color = boxes[i];
      int count = 0;
      while (i < boxes.length && boxes[i] == color) {
        count++;
        i++;
      }
      groups.add([color, count]);
    }
    
    int n = groups.length;
    List<List<List<int>>> dp = List.generate(n, (_) => 
      List.generate(n, (_) => List.filled(boxes.length + 1, 0)));
    
    int dfs(int l, int r, int k) {
      if (l > r) return 0;
      if (dp[l][r][k] != 0) return dp[l][r][k];
      
      int color = groups[l][0];
      int count = groups[l][1] + k;
      int res = count * count + dfs(l + 1, r, 0);
      
      for (int i = l + 1; i <= r; i++) {
        if (groups[i][0] == color) {
          int left = dfs(l + 1, i - 1, 0);
          int right = dfs(i, r, count);
          res = res > (left + right) ? res : (left + right);
        }
      }
      
      dp[l][r][k] = res;
      return res;
    }
    
    return dfs(0, n - 1, 0);
  }
}
