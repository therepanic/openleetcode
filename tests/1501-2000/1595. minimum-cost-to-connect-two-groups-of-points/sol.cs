public class Solution {
    private int[][] cost;
    private int[] mn;
    private int m, n;
    private int[,] memo;
    public int ConnectTwoGroups(IList<IList<int>> cost) {
        m = cost.Count;
        n = cost[0].Count;
        this.cost = new int[m][];
        for (int i = 0; i < m; i++) {
            this.cost[i] = new int[n];
            for (int j = 0; j < n; j++) {
                this.cost[i][j] = cost[i][j];
            }
        }
        mn = new int[n];
        for (int j = 0; j < n; j++) {
            int minVal = this.cost[0][j];
            for (int i = 1; i < m; i++) {
                minVal = Math.Min(minVal, this.cost[i][j]);
            }
            mn[j] = minVal;
        }
        memo = new int[m+1, 1<<n];
        for (int i = 0; i <= m; i++) {
            for (int mask = 0; mask < (1<<n); mask++) {
                memo[i, mask] = -1;
            }
        }
        return Fn(0, 0);
    }
    private int Fn(int i, int mask) {
        if (memo[i, mask] != -1) return memo[i, mask];
        if (i == m) {
            int sum = 0;
            for (int j = 0; j < n; j++) {
                if ((mask & (1<<j)) == 0) sum += mn[j];
            }
            memo[i, mask] = sum;
        } else {
            int best = int.MaxValue;
            for (int j = 0; j < n; j++) {
                best = Math.Min(best, this.cost[i][j] + Fn(i+1, mask | (1<<j)));
            }
            memo[i, mask] = best;
        }
        return memo[i, mask];
    }
}
