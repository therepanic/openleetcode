class Solution {
public:
    int diagonalSum(vector<vector<int>>& mat) {
        int summ = 0;
        int n = mat.size();
        for (int i = 0; i < n; i++) {
            summ += mat[i][i];
            summ += mat[i][n - 1 - i];
        }
        if (n % 2 == 1) {
            summ -= mat[n / 2][n / 2];
        }
        return summ;
    }
};
