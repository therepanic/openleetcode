public class Solution {
    public int NumPermsDISequence(string s) {
        int n = s.Length;
        int MOD = 1000000007;
        int[] dp = new int[]{1};
        for (int i = 1; i <= n; i++) {
            int[] prefix = new int[i + 1];
            prefix[0] = dp[0];
            for (int j = 1; j < i; j++) {
                prefix[j] = (prefix[j-1] + dp[j]) % MOD;
            }
            prefix[i] = prefix[i-1] % MOD;
            int[] ndp = new int[i + 1];
            if (s[i-1] == 'I') {
                for (int j = 0; j <= i; j++) {
                    ndp[j] = j > 0 ? prefix[j-1] % MOD : 0;
                }
            } else {
                for (int j = 0; j <= i; j++) {
                    ndp[j] = (prefix[i-1] - (j > 0 ? prefix[j-1] : 0)) % MOD;
                    if (ndp[j] < 0) ndp[j] += MOD;
                }
            }
            dp = ndp;
        }
        int sum = 0;
        foreach (int v in dp) sum = (sum + v) % MOD;
        return sum;
    }
}
