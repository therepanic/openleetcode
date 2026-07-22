public class Solution {
    private const int MOD = 1000000007;
    private int n;
    private string s1, s2, evil;
    private int[] lps;
    private int[][][][] memo;
    
    public int FindGoodStrings(int n, string s1, string s2, string evil) {
        this.n = n;
        this.s1 = s1;
        this.s2 = s2;
        this.evil = evil;
        int m = evil.Length;
        
        lps = new int[m];
        for (int i = 1; i < m; i++) {
            int j = lps[i - 1];
            while (j > 0 && evil[i] != evil[j]) {
                j = lps[j - 1];
            }
            if (evil[i] == evil[j]) {
                lps[i] = j + 1;
            }
        }
        
        memo = new int[n + 1][][][];
        for (int i = 0; i <= n; i++) {
            memo[i] = new int[m + 1][][];
            for (int j = 0; j <= m; j++) {
                memo[i][j] = new int[2][];
                for (int k = 0; k < 2; k++) {
                    memo[i][j][k] = new int[2] { -1, -1 };
                }
            }
        }
        
        return Dp(0, 0, 1, 1);
    }
    
    private int GetNextState(int currMatch, char c) {
        while (currMatch > 0 && c != evil[currMatch]) {
            currMatch = lps[currMatch - 1];
        }
        if (c == evil[currMatch]) {
            currMatch++;
        }
        return currMatch;
    }
    
    private int Dp(int idx, int eIdx, int tightLo, int tightHi) {
        if (eIdx == evil.Length) return 0;
        if (idx == n) return 1;
        
        if (memo[idx][eIdx][tightLo][tightHi] != -1) {
            return memo[idx][eIdx][tightLo][tightHi];
        }
        
        int res = 0;
        char lower = tightLo == 1 ? s1[idx] : 'a';
        char upper = tightHi == 1 ? s2[idx] : 'z';
        
        for (char c = lower; c <= upper; c++) {
            int nextEIdx = GetNextState(eIdx, c);
            int nextTightLo = (tightLo == 1 && c == lower) ? 1 : 0;
            int nextTightHi = (tightHi == 1 && c == upper) ? 1 : 0;
            
            res = (res + Dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD;
        }
        
        memo[idx][eIdx][tightLo][tightHi] = res;
        return res;
    }
}
