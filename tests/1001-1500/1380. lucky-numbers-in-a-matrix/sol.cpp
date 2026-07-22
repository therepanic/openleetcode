class Solution {
public:
    vector<int> luckyNumbers(vector<vector<int>>& matrix) {
        int rows = matrix.size();
        int cols = matrix[0].size();
        vector<int> ans;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                int ele1 = INT_MAX;
                for (int k = 0; k < cols; k++) {
                    if (matrix[i][k] < ele1) ele1 = matrix[i][k];
                }
                int ele2 = INT_MIN;
                for (int k = 0; k < rows; k++) {
                    if (matrix[k][j] > ele2) ele2 = matrix[k][j];
                }
                if (ele1 == matrix[i][j] && ele2 == matrix[i][j]) {
                    ans.push_back(matrix[i][j]);
                }
            }
        }
        return ans;
    }
};
