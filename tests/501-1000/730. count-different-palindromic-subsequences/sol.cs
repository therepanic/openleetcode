public class Solution {
    private const int MOD = 1000000007;
    private string s;
    private int[,] memo;
    
    public int CountPalindromicSubsequences(string s) {
        this.s = s;
        int n = s.Length;
        memo = new int[n + 1, n + 1];
        for (int i = 0; i <= n; i++)
            for (int j = 0; j <= n; j++)
                memo[i, j] = -1;
        return Dp(0, n);
    }
    
    private int Dp(int left, int right) {
        if (left >= right) return 0;
        if (memo[left, right] != -1) return memo[left, right];
        long res = 0;
        foreach (char ch in "abcd") {
            int l = s.IndexOf(ch, left);
            if (l == -1 || l >= right) continue;
            int r = s.LastIndexOf(ch, right - 1);
            if (r == -1 || r < left) continue;
            if (l == r) {
                res += 1;
            } else {
                res += Dp(l + 1, r) + 2;
            }
        }
        res %= MOD;
        memo[left, right] = (int)res;
        return (int)res;
    }
}
