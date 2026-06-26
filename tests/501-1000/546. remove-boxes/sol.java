class Solution {
    public int removeBoxes(int[] boxes) {
        List<int[]> groups = new ArrayList<>();
        int i = 0;
        while (i < boxes.length) {
            int color = boxes[i];
            int count = 0;
            while (i < boxes.length && boxes[i] == color) {
                count++;
                i++;
            }
            groups.add(new int[]{color, count});
        }
        
        int n = groups.size();
        int[][][] dp = new int[n][n][boxes.length + 1];
        return dfs(groups, 0, n - 1, 0, dp);
    }
    
    private int dfs(List<int[]> groups, int l, int r, int k, int[][][] dp) {
        if (l > r) return 0;
        if (dp[l][r][k] != 0) return dp[l][r][k];
        
        int color = groups.get(l)[0];
        int count = groups.get(l)[1] + k;
        int res = count * count + dfs(groups, l + 1, r, 0, dp);
        
        for (int i = l + 1; i <= r; i++) {
            if (groups.get(i)[0] == color) {
                int val = dfs(groups, l + 1, i - 1, 0, dp) + dfs(groups, i, r, count, dp);
                res = Math.max(res, val);
            }
        }
        
        dp[l][r][k] = res;
        return res;
    }
}
