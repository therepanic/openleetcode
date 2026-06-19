class Solution {
public:
    vector<int> findDiagonalOrder(vector<vector<int>>& mat) {
        if (mat.empty() || mat[0].empty()) {
            return {};
        }
        
        int m = mat.size(), n = mat[0].size();
        vector<int> result;
        result.reserve(m * n);
        int row = 0, col = 0;
        
        for (int i = 0; i < m * n; i++) {
            result.push_back(mat[row][col]);
            
            if ((row + col) % 2 == 0) {
                if (col == n - 1) {
                    row++;
                } else if (row == 0) {
                    col++;
                } else {
                    row--;
                    col++;
                }
            } else {
                if (row == m - 1) {
                    col++;
                } else if (col == 0) {
                    row++;
                } else {
                    row++;
                    col--;
                }
            }
        }
        
        return result;
    }
};
