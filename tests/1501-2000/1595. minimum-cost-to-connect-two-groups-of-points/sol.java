class Solution {
    private int[][] cost;
    private int[] mn;
    private int m, n;
    private int[][] memo;
    public int connectTwoGroups(List<List<Integer>> cost) {
        m = cost.size();
        n = cost.get(0).size();
        this.cost = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                this.cost[i][j] = cost.get(i).get(j);
            }
        }
        mn = new int[n];
        for (int j = 0; j < n; j++) {
            int minVal = Integer.MAX_VALUE;
            for (int i = 0; i < m; i++) {
                minVal = Math.min(minVal, this.cost[i][j]);
            }
            mn[j] = minVal;
        }
        memo = new int[m+1][1<<n];
        for (int[] row : memo) Arrays.fill(row, -1);
        return fn(0, 0);
    }
    public int connectTwoGroups(int[][] cost) {
        List<List<Integer>> rows = new java.util.ArrayList<>();
        for (int[] row : cost) {
            List<Integer> values = new java.util.ArrayList<>();
            for (int value : row) values.add(value);
            rows.add(values);
        }
        return connectTwoGroups(rows);
    }
    private int fn(int i, int mask) {
        if (memo[i][mask] != -1) return memo[i][mask];
        if (i == m) {
            int sum = 0;
            for (int j = 0; j < n; j++) {
                if ((mask & (1<<j)) == 0) sum += mn[j];
            }
            memo[i][mask] = sum;
        } else {
            int best = Integer.MAX_VALUE;
            for (int j = 0; j < n; j++) {
                best = Math.min(best, this.cost[i][j] + fn(i+1, mask | (1<<j)));
            }
            memo[i][mask] = best;
        }
        return memo[i][mask];
    }
}
