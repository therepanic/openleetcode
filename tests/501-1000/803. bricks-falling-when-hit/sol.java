class Solution {
    public int[] hitBricks(int[][] grid, int[][] hits) {
        int m = grid.length, n = grid[0].length;
        int[] parent = new int[m * n + 1];
        int[] rank = new int[m * n + 1];
        for (int i = 0; i < parent.length; i++) {
            parent[i] = i;
            rank[i] = 1;
        }
        
        java.util.Set<Integer> seen = new java.util.HashSet<>();
        for (int[] hit : hits) {
            int i = hit[0], j = hit[1];
            if (grid[i][j] == 1) {
                seen.add(i * n + j);
                grid[i][j] = 0;
            }
        }
        
        for (int j = 0; j < n; j++) {
            if (grid[0][j] == 1) {
                union(parent, rank, j, m * n);
            }
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) {
                    if (i > 0 && grid[i-1][j] == 1) {
                        union(parent, rank, i * n + j, (i-1) * n + j);
                    }
                    if (j > 0 && grid[i][j-1] == 1) {
                        union(parent, rank, i * n + j, i * n + j - 1);
                    }
                }
            }
        }
        
        int[] ans = new int[hits.length];
        int prevStable = rank[find(parent, m * n)];
        
        for (int idx = hits.length - 1; idx >= 0; idx--) {
            int i = hits[idx][0], j = hits[idx][1];
            if (seen.contains(i * n + j)) {
                grid[i][j] = 1;
                if (i == 0) {
                    union(parent, rank, j, m * n);
                }
                int[][] dirs = {{1,0}, {-1,0}, {0,1}, {0,-1}};
                for (int[] dir : dirs) {
                    int ii = i + dir[0], jj = j + dir[1];
                    if (ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1) {
                        union(parent, rank, i * n + j, ii * n + jj);
                    }
                }
                int currStable = rank[find(parent, m * n)];
                ans[idx] = Math.max(0, currStable - prevStable - 1);
                prevStable = currStable;
            } else {
                ans[idx] = 0;
            }
        }
        
        return ans;
    }
    
    private int find(int[] parent, int p) {
        if (p != parent[p]) {
            parent[p] = find(parent, parent[p]);
        }
        return parent[p];
    }
    
    private boolean union(int[] parent, int[] rank, int p, int q) {
        int rootP = find(parent, p);
        int rootQ = find(parent, q);
        if (rootP == rootQ) return false;
        if (rank[rootP] > rank[rootQ]) {
            int tmp = rootP;
            rootP = rootQ;
            rootQ = tmp;
        }
        parent[rootP] = rootQ;
        rank[rootQ] += rank[rootP];
        return true;
    }
}
