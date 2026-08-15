class Solution {
    public int countRoutes(int[] locations, int start, int finish, int fuel) {
        final int MOD = 1000000007;
        int n = locations.length;
        int[][] dp = new int[n][fuel + 1];
        for (int city = 0; city < n; city++) {
            dp[city][0] = (city == finish) ? 1 : 0;
        }
        for (int left = 1; left <= fuel; left++) {
            for (int city = 0; city < n; city++) {
                int total = (city == finish) ? 1 : 0;
                for (int nxt = 0; nxt < n; nxt++) {
                    if (nxt != city) {
                        int cost = Math.abs(locations[nxt] - locations[city]);
                        if (cost <= left) {
                            total = (total + dp[nxt][left - cost]) % MOD;
                        }
                    }
                }
                dp[city][left] = total;
            }
        }
        return dp[start][fuel];
    }
}
