#include <queue>
#include <utility>
#include <string>
#include <vector>
using namespace std;

class Solution {
public:
    int numIslands(vector<vector<string>>& grid) {
        int rows = static_cast<int>(grid.size());
        int cols = static_cast<int>(grid[0].size());
        int islands = 0;
        const int dr[4] = {1, -1, 0, 0};
        const int dc[4] = {0, 0, 1, -1};

        for (int r = 0; r < rows; ++r) {
            for (int c = 0; c < cols; ++c) {
                if (grid[r][c] != "1") {
                    continue;
                }
                ++islands;
                queue<pair<int, int>> q;
                q.push({r, c});
                grid[r][c] = "0";
                while (!q.empty()) {
                    auto current = q.front();
                    q.pop();
                    for (int i = 0; i < 4; ++i) {
                        int nr = current.first + dr[i];
                        int nc = current.second + dc[i];
                        if (0 <= nr && nr < rows && 0 <= nc && nc < cols && grid[nr][nc] == "1") {
                            grid[nr][nc] = "0";
                            q.push({nr, nc});
                        }
                    }
                }
            }
        }
        return islands;
    }
};
