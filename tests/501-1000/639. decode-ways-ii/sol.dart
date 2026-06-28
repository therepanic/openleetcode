class Solution {
  int numDecodings(String s) {
    const M = 1000000007;
    int n = s.length - 1;
    
    Map<String, int> d = {};
    for (int i = 1; i <= 26; i++) d[i.toString()] = 1;
    for (int i = 0; i <= 9; i++) d['*$i'] = 1 + (i < 7 ? 1 : 0);
    d['*'] = 9;
    d['**'] = 15;
    d['1*'] = 9;
    d['2*'] = 6;
    
    List<int> dp = List.filled(n + 2, 0);
    dp[0] = d[s[0]] ?? 0;
    dp[n + 1] = 1;
    
    for (int i = 0; i < n; i++) {
      String one = s[i + 1];
      String two = s[i] + s[i + 1];
      
      int count = ((d[one] ?? 0) * dp[i]) % M;
      count = (count + (d[two] ?? 0) * (i > 0 ? dp[i - 1] : 1)) % M;
      dp[i + 1] = count;
      
      if (dp[i + 1] == 0) return 0;
    }
    
    return dp[n];
  }
}
