class Solution {
  static const int MOD = 1000000007;
  
  int findGoodStrings(int n, String s1, String s2, String evil) {
    int m = evil.length;
    
    List<int> lps = List.filled(m, 0);
    for (int i = 1; i < m; i++) {
      int j = lps[i - 1];
      while (j > 0 && evil[i] != evil[j]) {
        j = lps[j - 1];
      }
      if (evil[i] == evil[j]) {
        lps[i] = j + 1;
      }
    }
    
    int getNextState(int currMatch, String c) {
      while (currMatch > 0 && c != evil[currMatch]) {
        currMatch = lps[currMatch - 1];
      }
      if (c == evil[currMatch]) {
        currMatch++;
      }
      return currMatch;
    }
    
    List<List<List<List<int>>>> memo = List.generate(
      n + 1,
      (_) => List.generate(
        m + 1,
        (_) => List.generate(
          2,
          (_) => List.filled(2, -1),
        ),
      ),
    );
    
    int dp(int idx, int eIdx, int tightLo, int tightHi) {
      if (eIdx == m) return 0;
      if (idx == n) return 1;
      
      if (memo[idx][eIdx][tightLo][tightHi] != -1) {
        return memo[idx][eIdx][tightLo][tightHi];
      }
      
      int res = 0;
      String lower = tightLo == 1 ? s1[idx] : 'a';
      String upper = tightHi == 1 ? s2[idx] : 'z';
      
      for (int charCode = lower.codeUnitAt(0); charCode <= upper.codeUnitAt(0); charCode++) {
        String c = String.fromCharCode(charCode);
        
        int nextEIdx = getNextState(eIdx, c);
        int nextTightLo = (tightLo == 1 && c == lower) ? 1 : 0;
        int nextTightHi = (tightHi == 1 && c == upper) ? 1 : 0;
        
        res = (res + dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD;
      }
      
      memo[idx][eIdx][tightLo][tightHi] = res;
      return res;
    }
    
    return dp(0, 0, 1, 1);
  }
}
