public class Solution {
    public int ColorTheGrid(int m, int n) {
        const int MOD = 1000000007;
        long total = 1;
        for (int i = 0; i < m; i++) total *= 3;
        long[,] dp = new long[n+1, total];
        int[,] rowValid = new int[total, total];
        List<int> good = new List<int>();
        int[,] pattern = new int[total, m];
        for (int i = 0; i < total; i++) {
            int val = i;
            bool valid = true;
            for (int k = 0; k < m; k++) {
                pattern[i,k] = val % 3;
                val /= 3;
            }
            for (int k = 1; k < m; k++) {
                if (pattern[i,k] == pattern[i,k-1]) {
                    valid = false;
                    break;
                }
            }
            if (valid) good.Add(i);
        }
        foreach (int i in good) dp[1,i] = 1;
        foreach (int i in good) {
            foreach (int j in good) {
                rowValid[i,j] = 1;
                for (int k = 0; k < m; k++) {
                    if (pattern[i,k] == pattern[j,k]) {
                        rowValid[i,j] = 0;
                        break;
                    }
                }
            }
        }
        for (int col = 2; col <= n; col++) {
            foreach (int i in good) {
                long totalWays = 0;
                foreach (int j in good) {
                    if (rowValid[i,j] == 1) {
                        totalWays += dp[col-1,j];
                    }
                }
                dp[col,i] = totalWays % MOD;
            }
        }
        long ans = 0;
        foreach (int i in good) ans += dp[n,i];
        return (int)(ans % MOD);
    }
}
