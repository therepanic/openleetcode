public class Solution {
    public string LargestNumber(int[] cost, int target) {
        int N = cost.Length;
        int[][] memo = new int[N + 1][];
        for (int i = 0; i <= N; i++) {
            memo[i] = new int[target + 1];
            for (int j = 0; j <= target; j++) {
                memo[i][j] = -1;
            }
        }
        
        Func<int, int, int> helper = null;
        helper = (i, c) => {
            if (c == 0) return 0;
            if (i == N || c < 0) return int.MinValue;
            if (memo[i][c] != -1) return memo[i][c];
            int take = helper(i, c - cost[i]);
            if (take != int.MinValue) take += 1;
            int notTake = helper(i + 1, c);
            memo[i][c] = Math.Max(take, notTake);
            return memo[i][c];
        };
        
        int e = helper(0, target);
        if (e == int.MinValue) return "0";
        
        string s = "";
        int t = target;
        for (int k = 0; k < e; k++) {
            for (int j = 9; j >= 1; j--) {
                if (cost[j-1] <= t && helper(0, t - cost[j-1]) == e - k - 1) {
                    t -= cost[j-1];
                    s += j.ToString();
                    break;
                }
            }
        }
        return s;
    }
}
