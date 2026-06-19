#include <vector>
#include <queue>
#include <utility>

using namespace std;

class Solution {
public:
    int trapRainWater(vector<vector<int>>& heightMap) {
        if (heightMap.empty() || heightMap.size() < 3 || heightMap[0].size() < 3) {
            return 0;
        }

        int m = heightMap.size(), n = heightMap[0].size();
        vector<vector<bool>> visited(m, vector<bool>(n, false));
        priority_queue<pair<int, pair<int, int>>, vector<pair<int, pair<int, int>>>, greater<>> heap;

        for (int i = 0; i < m; ++i) {
            heap.push({heightMap[i][0], {i, 0}});
            heap.push({heightMap[i][n - 1], {i, n - 1}});
            visited[i][0] = visited[i][n - 1] = true;
        }
        for (int j = 0; j < n; ++j) {
            heap.push({heightMap[0][j], {0, j}});
            heap.push({heightMap[m - 1][j], {m - 1, j}});
            visited[0][j] = visited[m - 1][j] = true;
        }

        int result = 0;
        vector<pair<int, int>> directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

        while (!heap.empty()) {
            auto [height, pos] = heap.top();
            heap.pop();
            int x = pos.first, y = pos.second;

            for (auto& dir : directions) {
                int nx = x + dir.first, ny = y + dir.second;
                if (nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny]) {
                    result += max(0, height - heightMap[nx][ny]);
                    heap.push({max(height, heightMap[nx][ny]), {nx, ny}});
                    visited[nx][ny] = true;
                }
            }
        }

        return result;
    }
};
