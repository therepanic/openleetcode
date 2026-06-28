class Solution {
  int dist(int size, int p, int t) {
    int diff = (t - p).abs();
    return diff < size - diff ? diff : size - diff;
  }
  
  int findRotateSteps(String ring, String key) {
    List<List<int>> mp = List.generate(26, (_) => List.filled(100, 0));
    List<int> freq = List.filled(26, 0);
    List<List<int>> dp = List.generate(100, (_) => List.filled(100, 0));
    
    int n = ring.length;
    int m = key.length;
    
    for (int i = 0; i < n; i++) {
      int idx = ring.codeUnitAt(i) - 'a'.codeUnitAt(0);
      mp[idx][freq[idx]] = i;
      freq[idx]++;
    }
    
    int firstChar = key.codeUnitAt(0) - 'a'.codeUnitAt(0);
    for (int i = 0; i < freq[firstChar]; i++) {
      dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1;
    }
    
    for (int i = 1; i < m; i++) {
      int prevChar = key.codeUnitAt(i - 1) - 'a'.codeUnitAt(0);
      int currChar = key.codeUnitAt(i) - 'a'.codeUnitAt(0);
      for (int j = 0; j < freq[currChar]; j++) {
        int mini = 1 << 30;
        for (int k = 0; k < freq[prevChar]; k++) {
          int val = dp[i - 1][mp[prevChar][k]] + dist(n, mp[currChar][j], mp[prevChar][k]) + 1;
          if (val < mini) mini = val;
        }
        dp[i][mp[currChar][j]] = mini;
      }
    }
    
    int lastChar = key.codeUnitAt(m - 1) - 'a'.codeUnitAt(0);
    int res = 1 << 30;
    for (int i = 0; i < freq[lastChar]; i++) {
      if (dp[m - 1][mp[lastChar][i]] < res) res = dp[m - 1][mp[lastChar][i]];
    }
    
    return res;
  }
}
