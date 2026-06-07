public class Solution {
    private int count;
    private boolean[] cols;
    private boolean[] diag1;
    private boolean[] diag2;
    private int n;

    public int totalNQueens(int n) {
        this.n = n;
        this.count = 0;
        cols = new boolean[n];
        diag1 = new boolean[2 * n];
        diag2 = new boolean[2 * n];
        backtrack(0);
        return count;
    }

    private void backtrack(int row) {
        if (row == n) {
            count++;
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
            backtrack(row + 1);
            cols[col] = false;
            diag1[d1] = false;
            diag2[d2] = false;
        }
    }
}
