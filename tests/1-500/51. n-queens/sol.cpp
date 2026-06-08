class Solution {
public:
    vector<vector<string>> solveNQueens(int n) {
        vector<vector<string>> res;
        vector<string> board(n, string(n, '.'));
        vector<bool> cols(n, false), diag1(2 * n, false), diag2(2 * n, false);
        function<void(int)> backtrack = [&](int row) {
            if (row == n) {
                res.push_back(board);
                return;
            }
            for (int col = 0; col < n; ++col) {
                int d1 = row + col;
                int d2 = row - col + n - 1;
                if (cols[col] || diag1[d1] || diag2[d2]) continue;
                cols[col] = diag1[d1] = diag2[d2] = true;
                board[row][col] = 'Q';
                backtrack(row + 1);
                board[row][col] = '.';
                cols[col] = diag1[d1] = diag2[d2] = false;
            }
        };
        backtrack(0);
        return res;
    }
};
