public class Solution {
    public int MinimumMoves(int[][] grid) {
        int n = grid.Length;
        int[] target = new int[] { n - 1, n - 2, 0 };
        
        Queue<(int[], int)> queue = new Queue<(int[], int)>();
        queue.Enqueue((new int[] { 0, 0, 0 }, 0));
        
        bool[,,] visited = new bool[n, n, 2];
        visited[0, 0, 0] = true;
        
        while (queue.Count > 0) {
            var (state, dist) = queue.Dequeue();
            int r = state[0], c = state[1], o = state[2];
            
            if (r == target[0] && c == target[1] && o == target[2]) {
                return dist;
            }
            
            if (o == 0) {
                if (c + 2 < n && grid[r][c + 2] == 0) {
                    if (!visited[r, c + 1, 0]) {
                        visited[r, c + 1, 0] = true;
                        queue.Enqueue((new int[] { r, c + 1, 0 }, dist + 1));
                    }
                }
                if (r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r + 1, c, 0]) {
                        visited[r + 1, c, 0] = true;
                        queue.Enqueue((new int[] { r + 1, c, 0 }, dist + 1));
                    }
                }
            } else {
                if (c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r, c + 1, 1]) {
                        visited[r, c + 1, 1] = true;
                        queue.Enqueue((new int[] { r, c + 1, 1 }, dist + 1));
                    }
                }
                if (r + 2 < n && grid[r + 2][c] == 0) {
                    if (!visited[r + 1, c, 1]) {
                        visited[r + 1, c, 1] = true;
                        queue.Enqueue((new int[] { r + 1, c, 1 }, dist + 1));
                    }
                }
            }
            
            if (r + 1 < n && c + 1 < n &&
                grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                int newO = 1 - o;
                if (!visited[r, c, newO]) {
                    visited[r, c, newO] = true;
                    queue.Enqueue((new int[] { r, c, newO }, dist + 1));
                }
            }
        }
        
        return -1;
    }
}
