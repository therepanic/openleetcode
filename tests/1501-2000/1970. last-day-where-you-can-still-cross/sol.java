class Solution {
    public int latestDayToCross(int row, int col, int[][] cells) {
        int left = 1, right = cells.length, answer = 0;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (canCross(mid, row, col, cells)) {
                answer = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return answer;
    }
    
    private boolean canCross(int day, int row, int col, int[][] cells) {
        int[][] grid = new int[row][col];
        for (int i = 0; i < day; i++) {
            int r = cells[i][0] - 1;
            int c = cells[i][1] - 1;
            grid[r][c] = 1;
        }
        
        int[] queueR = new int[row * col];
        int[] queueC = new int[row * col];
        int head = 0, tail = 0;
        boolean[][] visited = new boolean[row][col];
        
        for (int c = 0; c < col; c++) {
            if (grid[0][c] == 0) {
                queueR[tail] = 0;
                queueC[tail] = c;
                tail++;
                visited[0][c] = true;
            }
        }
        
        int[] dr = {1, -1, 0, 0};
        int[] dc = {0, 0, 1, -1};
        
        while (head < tail) {
            int r = queueR[head];
            int c = queueC[head];
            head++;
            if (r == row - 1) return true;
            for (int k = 0; k < 4; k++) {
                int nr = r + dr[k];
                int nc = c + dc[k];
                if (nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0) {
                    visited[nr][nc] = true;
                    queueR[tail] = nr;
                    queueC[tail] = nc;
                    tail++;
                }
            }
        }
        return false;
    }
}
