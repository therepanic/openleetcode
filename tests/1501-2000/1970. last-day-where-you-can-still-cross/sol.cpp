class Solution {
public:
    int latestDayToCross(int row, int col, vector<vector<int>>& cells) {
        int left = 1, right = cells.size(), answer = 0;
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
    
private:
    bool canCross(int day, int row, int col, vector<vector<int>>& cells) {
        vector<vector<int>> grid(row, vector<int>(col, 0));
        for (int i = 0; i < day; i++) {
            int r = cells[i][0] - 1;
            int c = cells[i][1] - 1;
            grid[r][c] = 1;
        }
        
        vector<int> queueR, queueC;
        vector<vector<bool>> visited(row, vector<bool>(col, false));
        
        for (int c = 0; c < col; c++) {
            if (grid[0][c] == 0) {
                queueR.push_back(0);
                queueC.push_back(c);
                visited[0][c] = true;
            }
        }
        
        int dr[4] = {1, -1, 0, 0};
        int dc[4] = {0, 0, 1, -1};
        int head = 0;
        while (head < queueR.size()) {
            int r = queueR[head];
            int c = queueC[head];
            head++;
            if (r == row - 1) return true;
            for (int k = 0; k < 4; k++) {
                int nr = r + dr[k];
                int nc = c + dc[k];
                if (nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0) {
                    visited[nr][nc] = true;
                    queueR.push_back(nr);
                    queueC.push_back(nc);
                }
            }
        }
        return false;
    }
};
