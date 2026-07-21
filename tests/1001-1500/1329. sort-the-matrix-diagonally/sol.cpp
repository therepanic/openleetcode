class Solution {
public:
    vector<vector<int>> diagonalSort(vector<vector<int>>& mat) {
        int m = mat.size(), n = mat[0].size();
        unordered_map<int, vector<int>> diagonals;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                diagonals[i - j].push_back(mat[i][j]);
            }
        }
        
        for (auto& [key, vec] : diagonals) {
            sort(vec.begin(), vec.end(), greater<int>());
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                auto& vec = diagonals[i - j];
                mat[i][j] = vec.back();
                vec.pop_back();
            }
        }
        
        return mat;
    }
};
