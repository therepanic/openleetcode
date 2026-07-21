class Solution {
public:
    int minCost(vector<vector<int>>& grid) {
        int m = grid.size();
        int n = grid[0].size();
        vector<vector<int>> minCost(m, vector<int>(n, INT_MAX));
        minCost[0][0] = 0;
        
        deque<pair<int, int>> dq;
        dq.push_front({0, 0});
        
        vector<pair<int, int>> directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
        
        while (!dq.empty()) {
            auto [r, c] = dq.front();
            dq.pop_front();
            
            for (int i = 0; i < 4; i++) {
                int nr = r + directions[i].first;
                int nc = c + directions[i].second;
                int cost = (grid[r][c] != i + 1) ? 1 : 0;
                
                if (nr >= 0 && nr < m && nc >= 0 && nc < n && minCost[r][c] + cost < minCost[nr][nc]) {
                    minCost[nr][nc] = minCost[r][c] + cost;
                    
                    if (cost == 1) {
                        dq.push_back({nr, nc});
                    } else {
                        dq.push_front({nr, nc});
                    }
                }
            }
        }
        
        return minCost[m - 1][n - 1];
    }
};
