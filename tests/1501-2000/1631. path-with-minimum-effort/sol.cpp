class Solution {
public:
    int minimumEffortPath(vector<vector<int>>& heights) {
        if (heights.empty()) return 0;
        int rows = heights.size(), cols = heights[0].size();
        priority_queue<tuple<int, int, int>, vector<tuple<int, int, int>>, greater<>> pq;
        pq.push({0, 0, 0});
        int maxEffort = 0;
        vector<vector<bool>> visited(rows, vector<bool>(cols, false));
        int dirs[4][2] = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        while (!pq.empty()) {
            auto [effort, r, c] = pq.top();
            pq.pop();
            maxEffort = max(maxEffort, effort);
            if (r == rows - 1 && c == cols - 1) return maxEffort;
            if (visited[r][c]) continue;
            visited[r][c] = true;
            for (auto& d : dirs) {
                int nr = r + d[0], nc = c + d[1];
                if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited[nr][nc]) {
                    int newEffort = abs(heights[nr][nc] - heights[r][c]);
                    pq.push({newEffort, nr, nc});
                }
            }
        }
        return maxEffort;
    }
};
