class Solution {
    public int minimumMoves(int[][] grid) {
        int n = grid.length;
        int[] start = new int[]{0, 0, 0};
        int[] target = new int[]{n - 1, n - 2, 0};
        
        java.util.Queue<int[]> queue = new java.util.LinkedList<>();
        queue.add(new int[]{start[0], start[1], start[2], 0});
        boolean[][][] visited = new boolean[n][n][2];
        visited[0][0][0] = true;
        
        int[][] dirsH = {{0, 1, 0}, {1, 0, 0}};
        int[][] dirsV = {{0, 1, 1}, {1, 0, 1}};
        
        while (!queue.isEmpty()) {
            int[] curr = queue.poll();
            int r = curr[0], c = curr[1], o = curr[2], dist = curr[3];
            
            if (r == target[0] && c == target[1] && o == target[2]) {
                return dist;
            }
            
            if (o == 0) {
                if (c + 2 < n && grid[r][c + 2] == 0) {
                    if (!visited[r][c + 1][0]) {
                        visited[r][c + 1][0] = true;
                        queue.add(new int[]{r, c + 1, 0, dist + 1});
                    }
                }
                if (r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r + 1][c][0]) {
                        visited[r + 1][c][0] = true;
                        queue.add(new int[]{r + 1, c, 0, dist + 1});
                    }
                }
            } else {
                if (c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r][c + 1][1]) {
                        visited[r][c + 1][1] = true;
                        queue.add(new int[]{r, c + 1, 1, dist + 1});
                    }
                }
                if (r + 2 < n && grid[r + 2][c] == 0) {
                    if (!visited[r + 1][c][1]) {
                        visited[r + 1][c][1] = true;
                        queue.add(new int[]{r + 1, c, 1, dist + 1});
                    }
                }
            }
            
            if (r + 1 < n && c + 1 < n &&
                grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                int newO = 1 - o;
                if (!visited[r][c][newO]) {
                    visited[r][c][newO] = true;
                    queue.add(new int[]{r, c, newO, dist + 1});
                }
            }
        }
        
        return -1;
    }
}
