class Solution {
    public int checkRecord(int n) {
        final int mod = 1000000007;
        int[][] dp = {{1, 0, 0}, {0, 0, 0}};
        
        for (int i = 0; i < n; i++) {
            int[][] ndp = {{0, 0, 0}, {0, 0, 0}};
            for (int absences = 0; absences < 2; absences++) {
                for (int lates = 0; lates < 3; lates++) {
                    int cur = dp[absences][lates];
                    if (cur == 0) continue;
                    ndp[absences][0] = (ndp[absences][0] + cur) % mod;
                    if (absences == 0) {
                        ndp[1][0] = (ndp[1][0] + cur) % mod;
                    }
                    if (lates < 2) {
                        ndp[absences][lates + 1] = (ndp[absences][lates + 1] + cur) % mod;
                    }
                }
            }
            dp = ndp;
        }
        
        int total = 0;
        for (int[] row : dp) {
            for (int value : row) {
                total = (total + value) % mod;
            }
        }
        return total;
    }
}
