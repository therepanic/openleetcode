class Solution {
  String shortestSuperstring(List<String> words) {
    int n = words.length;
    List<List<int>> overlap = List.generate(n, (_) => List.filled(n, 0));
    
    int getOverlap(String a, String b) {
      int maxOlap = 0;
      for (int k = 1; k <= a.length && k <= b.length; k++) {
        if (a.substring(a.length - k) == b.substring(0, k)) {
          if (k > maxOlap) maxOlap = k;
        }
      }
      return maxOlap;
    }
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i != j) {
          overlap[i][j] = getOverlap(words[i], words[j]);
        }
      }
    }
    
    List<List<String>> dp = List.generate(1 << n, (_) => List.filled(n, ""));
    for (int i = 0; i < n; i++) {
      dp[1 << i][i] = words[i];
    }
    
    for (int mask = 0; mask < (1 << n); mask++) {
      for (int u = 0; u < n; u++) {
        if ((mask & (1 << u)) == 0) continue;
        for (int v = 0; v < n; v++) {
          if ((mask & (1 << v)) != 0) continue;
          int newMask = mask | (1 << v);
          String candidate = dp[mask][u] + words[v].substring(overlap[u][v]);
          if (dp[newMask][v] == "" || candidate.length < dp[newMask][v].length) {
            dp[newMask][v] = candidate;
          }
        }
      }
    }
    
    String shortest = "";
    for (String candidate in dp[(1 << n) - 1]) {
      if (shortest == "" || candidate.length < shortest.length) {
        shortest = candidate;
      }
    }
    return shortest;
  }
}
