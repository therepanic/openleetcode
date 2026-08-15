class Solution {
  int minimizeTheDifference(List<List<int>> mat, int target) {
    for (var row in mat) {
      row.sort();
    }
    Map<String, int> dp = {};
    int mini = 1 << 31 - 1;
    
    int dfs(int i, int ans) {
      if (i < 0) {
        int diff = ans.abs();
        if (diff < mini) mini = diff;
        return diff;
      }
      String key = '$i,$ans';
      if (dp.containsKey(key)) return dp[key]!;
      if (ans < 0 && ans.abs() > mini) return 1 << 30;
      int take = 1 << 30;
      for (int z = 0; z < mat[i].length; z++) {
        if (z > 0 && mat[i][z] == mat[i][z-1]) continue;
        int candidate = dfs(i - 1, ans - mat[i][z]);
        take = take < candidate ? take : candidate;
        if (take == 0) break;
      }
      dp[key] = take;
      return take;
    }
    
    return dfs(mat.length - 1, target);
  }
}
