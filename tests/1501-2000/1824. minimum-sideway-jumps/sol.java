class Solution {
    public int minSideJumps(int[] obstacles) {
        int INF = Integer.MAX_VALUE / 2;
        int[] dp = {1, 0, 1};
        for (int i = 1; i < obstacles.length; i++) {
            int obs = obstacles[i];
            for (int j = 0; j < 3; j++) {
                if (obs == j + 1) dp[j] = INF;
            }
            for (int j = 0; j < 3; j++) {
                if (obs != j + 1) {
                    dp[j] = Math.min(dp[j], Math.min(dp[(j + 1) % 3], dp[(j + 2) % 3]) + 1);
                }
            }
        }
        return Math.min(dp[0], Math.min(dp[1], dp[2]));
    }
}
