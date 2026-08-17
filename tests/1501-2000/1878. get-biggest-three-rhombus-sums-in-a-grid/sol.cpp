class Solution {
public:
    vector<int> getBiggestThree(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size();
        int maxD = min(m, n) / 2;
        vector<int> result;
        for (int d = 0; d <= maxD; d++) {
            for (int i = d; i < m - d; i++) {
                for (int j = d; j < n - d; j++) {
                    int val = diamondSum(grid, i, j, d);
                    if (find(result.begin(), result.end(), val) == result.end()) {
                        result.push_back(val);
                    }
                }
            }
        }
        sort(result.begin(), result.end(), greater<int>());
        if (result.size() > 3) result.resize(3);
        return result;
    }
    
private:
    int diamondSum(vector<vector<int>>& grid, int i, int j, int d) {
        if (d == 0) return grid[i][j];
        int sum = 0;
        for (int t = 0; t <= d; t++) sum += grid[i - d + t][j + t];
        for (int t = 1; t <= d; t++) sum += grid[i + t][j + d - t];
        for (int t = 1; t <= d; t++) sum += grid[i + d - t][j - t];
        for (int t = 1; t < d; t++) sum += grid[i - t][j - d + t];
        return sum;
    }
};
