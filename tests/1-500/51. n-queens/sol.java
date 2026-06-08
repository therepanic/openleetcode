public class Solution {
    private List<List<String>> res;
    private char[][] board;
    private boolean[] cols;
    private boolean[] diag1;
    private boolean[] diag2;
    private int n;

    public List<List<String>> solveNQueens(int n) {
        this.n = n;
        this.res = new ArrayList<>();
        this.board = new char[n][n];
        for (int i = 0; i < n; i++) {
            Arrays.fill(board[i], '.');
        }
        this.cols = new boolean[n];
        this.diag1 = new boolean[2 * n];
        this.diag2 = new boolean[2 * n];
        backtrack(0);
        return res;
    }

    private void backtrack(int row) {
        if (row == n) {
            List<String> cur = new ArrayList<>();
            for (int i = 0; i < n; i++) {
                cur.add(new String(board[i]));
            }
            res.add(cur);
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
            backtrack(row + 1);
            board[row][col] = '.';
            cols[col] = false;
            diag1[d1] = false;
            diag2[d2] = false;
        }
    }
}
