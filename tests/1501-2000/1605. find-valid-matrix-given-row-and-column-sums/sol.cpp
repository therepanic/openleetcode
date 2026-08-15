class Solution {
public:
    vector<vector<int>> restoreMatrix(vector<int>& rowSum, vector<int>& colSum) {
        int m = rowSum.size(), n = colSum.size();
        vector<vector<int>> matrix(m, vector<int>(n, 0));
        int i = 0, j = 0;
        while (i < m && j < n) {
            int val = min(rowSum[i], colSum[j]);
            matrix[i][j] = val;
            rowSum[i] -= val;
            colSum[j] -= val;
            if (rowSum[i] == 0) i++;
            if (colSum[j] == 0) j++;
        }
        return matrix;
    }
};
