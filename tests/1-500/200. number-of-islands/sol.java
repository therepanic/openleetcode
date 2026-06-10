import java.util.ArrayDeque;
import java.util.Queue;

class Solution {
    public int numIslands(String[][] grid) {
        int rows = grid.length;
        int cols = grid[0].length;
        int islands = 0;
        int[] dr = {1, -1, 0, 0};
        int[] dc = {0, 0, 1, -1};

        for (int r = 0; r < rows; ++r) {
            for (int c = 0; c < cols; ++c) {
                if (!grid[r][c].equals("1")) {
                    continue;
                }
                islands++;
                Queue<int[]> queue = new ArrayDeque<>();
                queue.offer(new int[] {r, c});
                grid[r][c] = "0";
                while (!queue.isEmpty()) {
                    int[] cell = queue.poll();
                    for (int i = 0; i < 4; ++i) {
                        int nr = cell[0] + dr[i];
                        int nc = cell[1] + dc[i];
                        if (0 <= nr && nr < rows && 0 <= nc && nc < cols && grid[nr][nc].equals("1")) {
                            grid[nr][nc] = "0";
                            queue.offer(new int[] {nr, nc});
                        }
                    }
                }
            }
        }

        return islands;
    }
}
