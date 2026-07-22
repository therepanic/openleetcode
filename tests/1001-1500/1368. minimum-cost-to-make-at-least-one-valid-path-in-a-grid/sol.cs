public class Solution {
    public int MinCost(int[][] grid) {
        int m = grid.Length;
        int n = grid[0].Length;
        int[][] minCost = new int[m][];
        for (int i = 0; i < m; i++) {
            minCost[i] = new int[n];
            Array.Fill(minCost[i], int.MaxValue);
        }
        minCost[0][0] = 0;
        
        var deque = new LinkedList<(int, int)>();
        deque.AddFirst((0, 0));
        
        int[][] directions = new int[][] {
            new int[] {0, 1},
            new int[] {0, -1},
            new int[] {1, 0},
            new int[] {-1, 0}
        };
        
        while (deque.Count > 0) {
            var (r, c) = deque.First.Value;
            deque.RemoveFirst();
            
            for (int i = 0; i < 4; i++) {
                int nr = r + directions[i][0];
                int nc = c + directions[i][1];
                int cost = (grid[r][c] != i + 1) ? 1 : 0;
                
                if (nr >= 0 && nr < m && nc >= 0 && nc < n && minCost[r][c] + cost < minCost[nr][nc]) {
                    minCost[nr][nc] = minCost[r][c] + cost;
                    
                    if (cost == 1) {
                        deque.AddLast((nr, nc));
                    } else {
                        deque.AddFirst((nr, nc));
                    }
                }
            }
        }
        
        return minCost[m - 1][n - 1];
    }
}
