public class Solution {
    public bool HasValidPath(int[][] grid) {
        int m = grid.Length;
        int n = grid[0].Length;
        
        Dictionary<int, int[][]> dir = new Dictionary<int, int[][]>() {
            {1, new int[][] { new int[] {0, -1}, new int[] {0, 1} }},
            {2, new int[][] { new int[] {-1, 0}, new int[] {1, 0} }},
            {3, new int[][] { new int[] {0, -1}, new int[] {1, 0} }},
            {4, new int[][] { new int[] {0, 1}, new int[] {1, 0} }},
            {5, new int[][] { new int[] {0, -1}, new int[] {-1, 0} }},
            {6, new int[][] { new int[] {0, 1}, new int[] {-1, 0} }}
        };
        
        bool[][] vis = new bool[m][];
        for (int i = 0; i < m; i++) {
            vis[i] = new bool[n];
        }
        
        Queue<(int, int)> q = new Queue<(int, int)>();
        q.Enqueue((0, 0));
        vis[0][0] = true;
        
        while (q.Count > 0) {
            var (r, c) = q.Dequeue();
            
            if (r == m - 1 && c == n - 1) {
                return true;
            }
            
            foreach (var d in dir[grid[r][c]]) {
                int nr = r + d[0];
                int nc = c + d[1];
                
                if (nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]) {
                    continue;
                }
                
                foreach (var bd in dir[grid[nr][nc]]) {
                    if (nr + bd[0] == r && nc + bd[1] == c) {
                        vis[nr][nc] = true;
                        q.Enqueue((nr, nc));
                    }
                }
            }
        }
        
        return false;
    }
}
