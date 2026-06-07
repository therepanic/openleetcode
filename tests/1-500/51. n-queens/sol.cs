public class Solution {
    private IList<IList<string>> res;
    private char[][] board;
    private bool[] cols;
    private bool[] diag1;
    private bool[] diag2;
    private int n;

    public IList<IList<string>> SolveNQueens(int n) {
        this.n = n;
        res = new List<IList<string>>();
        board = new char[n][];
        for (int i = 0; i < n; i++) {
            board[i] = new char[n];
            for (int j = 0; j < n; j++) {
                board[i][j] = '.';
            }
        }
        cols = new bool[n];
        diag1 = new bool[2 * n];
        diag2 = new bool[2 * n];
        Backtrack(0);
        return res;
    }

    private void Backtrack(int row) {
        if (row == n) {
            var cur = new List<string>();
            for (int i = 0; i < n; i++) {
                cur.Add(new string(board[i]));
            }
            res.Add(cur);
            return;
        }
        for (int col = 0; col < n; col++) {
            int d1 = row + col;
            int d2 = row - col + n - 1;
            if (cols[col] || diag1[d1] || diag2[d2]) {
                continue;
            }
            cols[col] = true;
            diag1[d1] = true;
            diag2[d2] = true;
            board[row][col] = 'Q';
            Backtrack(row + 1);
            board[row][col] = '.';
            cols[col] = false;
            diag1[d1] = false;
            diag2[d2] = false;
        }
    }
}
