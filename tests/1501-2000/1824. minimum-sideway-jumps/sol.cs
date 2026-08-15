public class Solution {
    public int MinSideJumps(int[] obstacles) {
        int INF = int.MaxValue / 2;
        int[] dp = { 1, 0, 1 };
        for (int i = 1; i < obstacles.Length; i++) {
            int obs = obstacles[i];
            for (int j = 0; j < 3; j++) {
                if (obs == j + 1) dp[j] = INF;
            }
            for (int j = 0; j < 3; j++) {
                if (obs != j + 1) {
                    dp[j] = Math.Min(dp[j], Math.Min(dp[(j + 1) % 3], dp[(j + 2) % 3]) + 1);
                }
            }
        }
        return Math.Min(dp[0], Math.Min(dp[1], dp[2]));
    }
}
