import java.util.*;

class Solution {
    public int minCost(int n, int[] cuts) {
        int[] c = new int[cuts.length + 2];
        System.arraycopy(cuts, 0, c, 0, cuts.length);
        c[cuts.length] = 0;
        c[cuts.length + 1] = n;
        Arrays.sort(c);
        int m = c.length;
        int[][] memo = new int[m][m];
        for (int[] row : memo) Arrays.fill(row, -1);
        return optimize(0, m-1, c, memo);
    }
    
    private int optimize(int i, int j, int[] c, int[][] memo) {
        if (j - i <= 1) return 0;
        if (memo[i][j] != -1) return memo[i][j];
        int res = Integer.MAX_VALUE;
        for (int k = i+1; k < j; k++) {
            int val = optimize(i, k, c, memo) + optimize(k, j, c, memo);
            res = Math.min(res, val);
        }
        memo[i][j] = res + (c[j] - c[i]);
        return memo[i][j];
    }
}
