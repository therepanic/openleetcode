public class Solution {
    public int FirstDayBeenInAllRooms(int[] nextVisit) {
        const int MOD = 1000000007;
        int n = nextVisit.Length;
        long[] dp = new long[n];

        for (int i = 1; i < n; i++) {
            dp[i] = (2 * dp[i-1] - dp[nextVisit[i-1]] + 2 + MOD) % MOD;
        }
        
        return (int) dp[n-1];
    }
}
