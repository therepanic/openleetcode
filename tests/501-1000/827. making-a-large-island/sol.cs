public class Solution {
    public int LargestIsland(int[][] grid) {
        int r = grid.Length;
        int c = grid[0].Length;
        int[][] dirs = new int[][] { new int[] {1, 0}, new int[] {0, 1}, new int[] {-1, 0}, new int[] {0, -1} };
        int island = 2;
        Dictionary<int, int> a = new Dictionary<int, int>();
        
        int Dfs(int i, int j, int x) {
            int tot = 1;
            grid[i][j] = x;
            foreach (var d in dirs) {
                int nx = i + d[0];
                int ny = j + d[1];
                if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1) {
                    tot += Dfs(nx, ny, x);
                }
            }
            return tot;
        }
        
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (grid[i][j] == 1) {
                    a[island] = Dfs(i, j, island);
                    island++;
                }
            }
        }
        
        int res = 0;
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (grid[i][j] == 0) {
                    HashSet<int> y = new HashSet<int>();
                    foreach (var d in dirs) {
                        int nx = i + d[0];
                        int ny = j + d[1];
                        if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0) {
                            y.Add(grid[nx][ny]);
                        }
                    }
                    int tot = 1;
                    foreach (int b in y) {
                        tot += a[b];
                    }
                    res = Math.Max(res, tot);
                }
            }
        }
        
        return Math.Max(res, a.GetValueOrDefault(2, 0));
    }
}
