class Solution {
    public int[] getBiggestThree(int[][] grid) {
        int m = grid.length, n = grid[0].length;
        int maxD = Math.min(m, n) / 2;
        List<Integer> list = new ArrayList<>();
        for (int d = 0; d <= maxD; d++) {
            for (int i = d; i < m - d; i++) {
                for (int j = d; j < n - d; j++) {
                    int val = diamondSum(grid, i, j, d);
                    if (!list.contains(val)) list.add(val);
                }
            }
        }
        Collections.sort(list, Collections.reverseOrder());
        int[] ans = new int[Math.min(3, list.size())];
        for (int k = 0; k < ans.length; k++) ans[k] = list.get(k);
        return ans;
    }
    
    private int diamondSum(int[][] grid, int i, int j, int d) {
        if (d == 0) return grid[i][j];
        int sum = 0;
        for (int t = 0; t <= d; t++) sum += grid[i - d + t][j + t];
        for (int t = 1; t <= d; t++) sum += grid[i + t][j + d - t];
        for (int t = 1; t <= d; t++) sum += grid[i + d - t][j - t];
        for (int t = 1; t < d; t++) sum += grid[i - t][j - d + t];
        return sum;
    }
}
