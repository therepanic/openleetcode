public class Solution {
    public bool ContainsCycle(char[][] grid) {
        int n = grid.Length;
        int m = grid[0].Length;
        bool[][] visited = new bool[n][];
        for (int i = 0; i < n; i++) visited[i] = new bool[m];
        int[][] directions = new int[][] { new int[] {-1,0}, new int[] {1,0}, new int[] {0,-1}, new int[] {0,1} };
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j]) {
                    if (Bfs(i, j, grid, visited, directions, n, m)) return true;
                }
            }
        }
        return false;
    }
    
    private bool Bfs(int startI, int startJ, char[][] grid, bool[][] visited, int[][] directions, int n, int m) {
        Queue<(int, int, int, int)> queue = new Queue<(int, int, int, int)>();
        queue.Enqueue((startI, startJ, -1, -1));
        visited[startI][startJ] = true;
        
        while (queue.Count > 0) {
            var (x, y, px, py) = queue.Dequeue();
            foreach (var dir in directions) {
                int nx = x + dir[0];
                int ny = y + dir[1];
                if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                if (grid[nx][ny] != grid[x][y]) continue;
                if (nx == px && ny == py) continue;
                if (visited[nx][ny]) return true;
                visited[nx][ny] = true;
                queue.Enqueue((nx, ny, x, y));
            }
        }
        return false;
    }
}
