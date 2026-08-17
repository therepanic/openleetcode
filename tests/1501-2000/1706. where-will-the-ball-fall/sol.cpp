class Solution {
public:
    vector<int> findBall(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size();
        vector<int> result(n);
        for (int col = 0; col < n; ++col) {
            int cur = col;
            for (int row = 0; row < m; ++row) {
                int d = grid[row][cur];
                int nxt = cur + d;
                if (nxt < 0 || nxt >= n || grid[row][nxt] != d) {
                    cur = -1;
                    break;
                }
                cur = nxt;
            }
            result[col] = cur;
        }
        return result;
    }
};
