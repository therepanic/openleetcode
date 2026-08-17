class Solution {
    public int[][] matrixRankTransform(int[][] matrix) {
        int m = matrix.length, n = matrix[0].length;
        Map<Integer, List<int[]>> mp = new HashMap<>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                mp.computeIfAbsent(matrix[i][j], k -> new ArrayList<>()).add(new int[]{i, j});
            }
        }
        
        int[] rank = new int[m+n];
        int[][] ans = new int[m][n];
        
        int[] parent = new int[m+n];
        for (int k : mp.keySet().stream().sorted().mapToInt(Integer::intValue).toArray()) {
            for (int p = 0; p < m+n; p++) parent[p] = p;
            for (int[] cell : mp.get(k)) {
                int i = cell[0], j = cell[1];
                int ii = i; while (ii != parent[ii]) ii = parent[ii];
                int jj = m+j; while (jj != parent[jj]) jj = parent[jj];
                parent[ii] = jj;
                rank[jj] = Math.max(rank[ii], rank[jj]);
            }
            
            Set<Integer> seen = new HashSet<>();
            for (int[] cell : mp.get(k)) {
                int i = cell[0], j = cell[1];
                int ii = i; while (ii != parent[ii]) ii = parent[ii];
                if (!seen.contains(ii)) {
                    rank[ii] += 1;
                }
                seen.add(ii);
                int val = rank[ii];
                rank[i] = val;
                rank[m+j] = val;
                ans[i][j] = val;
            }
        }
        return ans;
    }
}
