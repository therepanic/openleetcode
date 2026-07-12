#include <vector>
#include <queue>
#include <set>
#include <utility>
#include <string>

class Solution {
public:
    int numEnclaves(vector<vector<int>>& grid) {
        int total = 0;
        for (const auto& row : grid) {
            for (int val : row) {
                total += val;
            }
        }
        
        int m = grid.size();
        int n = grid[0].size();
        if (m == 1 || n == 1) return 0;
        
        std::queue<std::pair<int, int>> q;
        std::set<std::pair<int, int>> seen;
        
        for (int i = 0; i < n; i++) {
            if (grid[0][i] == 1) {
                q.push({0, i});
                seen.insert({0, i});
            }
            if (grid[m-1][i] == 1) {
                q.push({m-1, i});
                seen.insert({m-1, i});
            }
        }
        for (int i = 1; i < m-1; i++) {
            if (grid[i][0] == 1) {
                q.push({i, 0});
                seen.insert({i, 0});
            }
            if (grid[i][n-1] == 1) {
                q.push({i, n-1});
                seen.insert({i, n-1});
            }
        }
        
        int directions[4][2] = {{0,1},{1,0},{0,-1},{-1,0}};
        int next_total = 0;
        
        while (!q.empty()) {
            auto [x, y] = q.front();
            q.pop();
            next_total++;
            
            for (auto& dir : directions) {
                int nx = x + dir[0];
                int ny = y + dir[1];
                if (nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && seen.find({nx, ny}) == seen.end()) {
                    q.push({nx, ny});
                    seen.insert({nx, ny});
                }
            }
        }
        
        return total - next_total;
    }
};
