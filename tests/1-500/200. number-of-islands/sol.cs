using System.Collections.Generic;

public class Solution {
    public int NumIslands(string[][] grid) {
        int rows = grid.Length;
        int cols = grid[0].Length;
        int islands = 0;
        int[] dr = {1, -1, 0, 0};
        int[] dc = {0, 0, 1, -1};

        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (grid[r][c] != "1") {
                    continue;
                }
                islands++;
                var queue = new Queue<(int row, int col)>();
                queue.Enqueue((r, c));
                grid[r][c] = "0";
                while (queue.Count > 0) {
                    var cell = queue.Dequeue();
                    for (int i = 0; i < 4; i++) {
                        int nr = cell.row + dr[i];
                        int nc = cell.col + dc[i];
                        if (0 <= nr && nr < rows && 0 <= nc && nc < cols && grid[nr][nc] == "1") {
                            grid[nr][nc] = "0";
                            queue.Enqueue((nr, nc));
                        }
                    }
                }
            }
        }

        return islands;
    }
}
