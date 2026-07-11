public class Solution {
    public int[] HitBricks(int[][] grid, int[][] hits) {
        int m = grid.Length, n = grid[0].Length;
        int[] parent = new int[m * n + 1];
        int[] rank = new int[m * n + 1];
        for (int i = 0; i <= m * n; i++) {
            parent[i] = i;
            rank[i] = 1;
        }
        
        int Find(int p) {
            if (p != parent[p]) {
                parent[p] = Find(parent[p]);
            }
            return parent[p];
        }
        
        bool Union(int p, int q) {
            int rootP = Find(p);
            int rootQ = Find(q);
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
        
        HashSet<int> seen = new HashSet<int>();
        foreach (var hit in hits) {
            int i = hit[0], j = hit[1];
            if (grid[i][j] == 1) {
                seen.Add(i * n + j);
                grid[i][j] = 0;
            }
        }
        
        for (int j = 0; j < n; j++) {
            if (grid[0][j] == 1) {
                Union(j, m * n);
            }
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) {
                    if (i > 0 && grid[i-1][j] == 1) {
                        Union(i * n + j, (i-1) * n + j);
                    }
                    if (j > 0 && grid[i][j-1] == 1) {
                        Union(i * n + j, i * n + j - 1);
                    }
                }
            }
        }
        
        int[] ans = new int[hits.Length];
        int prevStable = rank[Find(m * n)];
        int[][] dirs = new int[][] { new int[]{1,0}, new int[]{-1,0}, new int[]{0,1}, new int[]{0,-1} };
        
        for (int idx = hits.Length - 1; idx >= 0; idx--) {
            int i = hits[idx][0], j = hits[idx][1];
            if (seen.Contains(i * n + j)) {
                grid[i][j] = 1;
                if (i == 0) {
                    Union(j, m * n);
                }
                foreach (var dir in dirs) {
                    int ii = i + dir[0], jj = j + dir[1];
                    if (ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1) {
                        Union(i * n + j, ii * n + jj);
                    }
                }
                int currStable = rank[Find(m * n)];
                ans[idx] = Math.Max(0, currStable - prevStable - 1);
                prevStable = currStable;
            } else {
                ans[idx] = 0;
            }
        }
        
        return ans;
    }
}
