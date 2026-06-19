public class Solution {
    public IList<IList<int>> PacificAtlantic(int[][] heights) {
        if (heights.Length == 0) return new List<IList<int>>();
        int m = heights.Length, n = heights[0].Length;
        int[][] directions = new int[][] { new int[] {1,0}, new int[] {-1,0}, new int[] {0,1}, new int[] {0,-1} };
        
        bool[][] pacific = new bool[m][];
        bool[][] atlantic = new bool[m][];
        for (int i = 0; i < m; i++) {
            pacific[i] = new bool[n];
            atlantic[i] = new bool[n];
        }
        
        void Dfs(int i, int j, bool[][] visited) {
            visited[i][j] = true;
            foreach (var d in directions) {
                int x = i + d[0], y = j + d[1];
                if (x >= 0 && x < m && y >= 0 && y < n 
                    && !visited[x][y] && heights[x][y] >= heights[i][j]) {
                    Dfs(x, y, visited);
                }
            }
        }
        
        for (int j = 0; j < n; j++) Dfs(0, j, pacific);
        for (int i = 0; i < m; i++) Dfs(i, 0, pacific);
        for (int j = 0; j < n; j++) Dfs(m-1, j, atlantic);
        for (int i = 0; i < m; i++) Dfs(i, n-1, atlantic);
        
        IList<IList<int>> result = new List<IList<int>>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (pacific[i][j] && atlantic[i][j]) {
                    result.Add(new List<int> { i, j });
                }
            }
        }
        return result;
    }
}
