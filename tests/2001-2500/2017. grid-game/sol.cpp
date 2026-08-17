class Solution {
public:
    long long gridGame(vector<vector<int>>& grid) {
        long long minResult = LLONG_MAX;
        long long row1Sum = 0;
        for (int val : grid[0]) {
            row1Sum += val;
        }
        long long row2Sum = 0;
        
        for (int i = 0; i < grid[0].size(); i++) {
            row1Sum -= grid[0][i];
            minResult = min(minResult, max(row1Sum, row2Sum));
            row2Sum += grid[1][i];
        }
        
        return minResult;
    }
};
