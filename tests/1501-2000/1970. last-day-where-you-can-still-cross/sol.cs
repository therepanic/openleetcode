public class Solution {
    public int LatestDayToCross(int row, int col, int[][] cells) {
        int left = 1, right = cells.Length, answer = 0;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (CanCross(mid, row, col, cells)) {
                answer = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return answer;
    }
    
    private bool CanCross(int day, int row, int col, int[][] cells) {
        int[,] grid = new int[row, col];
        for (int i = 0; i < day; i++) {
            int r = cells[i][0] - 1;
            int c = cells[i][1] - 1;
            grid[r, c] = 1;
        }
        
        List<int> queueR = new List<int>();
        List<int> queueC = new List<int>();
        bool[,] visited = new bool[row, col];
        
        for (int c = 0; c < col; c++) {
            if (grid[0, c] == 0) {
                queueR.Add(0);
                queueC.Add(c);
                visited[0, c] = true;
            }
        }
        
        int[] dr = {1, -1, 0, 0};
        int[] dc = {0, 0, 1, -1};
        int head = 0;
        while (head < queueR.Count) {
            int r = queueR[head];
            int c = queueC[head];
            head++;
            if (r == row - 1) return true;
            for (int k = 0; k < 4; k++) {
                int nr = r + dr[k];
                int nc = c + dc[k];
                if (nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr, nc] && grid[nr, nc] == 0) {
                    visited[nr, nc] = true;
                    queueR.Add(nr);
                    queueC.Add(nc);
                }
            }
        }
        return false;
    }
}
