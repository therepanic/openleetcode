public class Solution {
    public int MaxHeight(int[][] cuboids) {
        foreach (var c in cuboids) {
            Array.Sort(c);
        }
        Array.Sort(cuboids, (a,b) => {
            if (a[0] != b[0]) return a[0].CompareTo(b[0]);
            if (a[1] != b[1]) return a[1].CompareTo(b[1]);
            return a[2].CompareTo(b[2]);
        });
        int n = cuboids.Length;
        int[] dp = new int[n];
        int ans = 0;
        for (int i = 0; i < n; i++) {
            dp[i] = cuboids[i][2];
            for (int j = 0; j < i; j++) {
                if (cuboids[j][0] <= cuboids[i][0] && cuboids[j][1] <= cuboids[i][1] && cuboids[j][2] <= cuboids[i][2]) {
                    dp[i] = Math.Max(dp[i], dp[j] + cuboids[i][2]);
                }
            }
            ans = Math.Max(ans, dp[i]);
        }
        return ans;
    }
}
