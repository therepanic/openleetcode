class Solution {
    private static final int MOD = 1000000007;
    private String s;
    private Integer[][] memo;
    
    public int countPalindromicSubsequences(String s) {
        this.s = s;
        int n = s.length();
        memo = new Integer[n + 1][n + 1];
        return dp(0, n);
    }
    
    private int dp(int left, int right) {
        if (left >= right) return 0;
        if (memo[left][right] != null) return memo[left][right];
        long res = 0;
        for (char ch : new char[]{'a', 'b', 'c', 'd'}) {
            int l = s.indexOf(ch, left);
            if (l == -1 || l >= right) continue;
            int r = s.lastIndexOf(ch, right - 1);
            if (r == -1 || r < left) continue;
            if (l == r) {
                res += 1;
            } else {
                res += dp(l + 1, r) + 2;
            }
        }
        res %= MOD;
        memo[left][right] = (int) res;
        return (int) res;
    }
}
