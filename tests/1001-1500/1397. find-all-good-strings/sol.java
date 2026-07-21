class Solution {
    private static final int MOD = 1000000007;
    private int n;
    private String s1, s2, evil;
    private int[] lps;
    private Integer[][][][] memo;
    
    public int findGoodStrings(int n, String s1, String s2, String evil) {
        this.n = n;
        this.s1 = s1;
        this.s2 = s2;
        this.evil = evil;
        int m = evil.length();
        
        lps = new int[m];
        for (int i = 1; i < m; i++) {
            int j = lps[i - 1];
            while (j > 0 && evil.charAt(i) != evil.charAt(j)) {
                j = lps[j - 1];
            }
            if (evil.charAt(i) == evil.charAt(j)) {
                lps[i] = j + 1;
            }
        }
        
        memo = new Integer[n + 1][m + 1][2][2];
        return dp(0, 0, 1, 1);
    }
    
    private int getNextState(int currMatch, char c) {
        while (currMatch > 0 && c != evil.charAt(currMatch)) {
            currMatch = lps[currMatch - 1];
        }
        if (c == evil.charAt(currMatch)) {
            currMatch++;
        }
        return currMatch;
    }
    
    private int dp(int idx, int eIdx, int tightLo, int tightHi) {
        if (eIdx == evil.length()) return 0;
        if (idx == n) return 1;
        
        if (memo[idx][eIdx][tightLo][tightHi] != null) {
            return memo[idx][eIdx][tightLo][tightHi];
        }
        
        int res = 0;
        char lower = tightLo == 1 ? s1.charAt(idx) : 'a';
        char upper = tightHi == 1 ? s2.charAt(idx) : 'z';
        
        for (char c = lower; c <= upper; c++) {
            int nextEIdx = getNextState(eIdx, c);
            int nextTightLo = (tightLo == 1 && c == lower) ? 1 : 0;
            int nextTightHi = (tightHi == 1 && c == upper) ? 1 : 0;
            
            res = (res + dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD;
        }
        
        memo[idx][eIdx][tightLo][tightHi] = res;
        return res;
    }
}
