public class Solution {
    public int[][] FindFarmland(int[][] land) {
        int n = land.Length;
        int m = land[0].Length;
        bool[][] visited = new bool[n][];
        for (int i = 0; i < n; i++) visited[i] = new bool[m];
        int[][] directions = new int[][] { new int[]{-1,0}, new int[]{0,1}, new int[]{1,0}, new int[]{0,-1} };
        
        int[] maxr = new int[1];
        int[] maxc = new int[1];
        
        void Dfs(int r, int c) {
            visited[r][c] = true;
            maxr[0] = Math.Max(maxr[0], r);
            maxc[0] = Math.Max(maxc[0], c);
            foreach (var d in directions) {
                int nr = r + d[0];
                int nc = c + d[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                    if (!visited[nr][nc] && land[nr][nc] == 1) {
                        Dfs(nr, nc);
                    }
                }
            }
        }
        
        var res = new List<int[]>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (land[i][j] == 1 && !visited[i][j]) {
                    maxr[0] = i;
                    maxc[0] = j;
                    Dfs(i, j);
                    res.Add(new int[]{i, j, maxr[0], maxc[0]});
                }
            }
        }
        return res.ToArray();
    }
}
