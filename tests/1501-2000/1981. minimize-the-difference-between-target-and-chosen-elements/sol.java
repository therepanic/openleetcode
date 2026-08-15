class Solution {
    private int[][] mat;
    private java.util.HashMap<Long, Integer> dp;
    private int mini = Integer.MAX_VALUE;
    
    public int minimizeTheDifference(int[][] mat, int target) {
        this.mat = mat;
        dp = new java.util.HashMap<>();
        for (int[] row : mat) {
            java.util.Arrays.sort(row);
        }
        return dfs(mat.length - 1, target);
    }
    
    private int dfs(int i, int ans) {
        if (i < 0) {
            mini = Math.min(mini, Math.abs(ans));
            return Math.abs(ans);
        }
        long key = (long)i * 100000 + (ans + 100000);
        if (dp.containsKey(key)) return dp.get(key);
        if (ans < 0 && Math.abs(ans) > mini) return Integer.MAX_VALUE / 2;
        int take = Integer.MAX_VALUE / 2;
        for (int z = 0; z < mat[i].length; z++) {
            if (z > 0 && mat[i][z] == mat[i][z-1]) continue;
            take = Math.min(take, dfs(i-1, ans - mat[i][z]));
            if (take == 0) break;
        }
        dp.put(key, take);
        return take;
    }
}
