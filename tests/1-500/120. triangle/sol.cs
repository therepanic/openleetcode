
public class Solution {
    public int MinimumTotal(System.Collections.Generic.IList<System.Collections.Generic.IList<int>> triangle) {
        var dp = new int[triangle[triangle.Count - 1].Count];
        for (int i = 0; i < dp.Length; i++) dp[i] = triangle[triangle.Count - 1][i];
        for (int row = triangle.Count - 2; row >= 0; row--) {
            for (int col = 0; col <= row; col++) {
                dp[col] = triangle[row][col] + System.Math.Min(dp[col], dp[col + 1]);
            }
        }
        return dp[0];
    }
}
