public class Solution {
    private int count;
    private bool[] cols;
    private bool[] diag1;
    private bool[] diag2;
    private int n;

    public int TotalNQueens(int n) {
        this.n = n;
        count = 0;
        cols = new bool[n];
        diag1 = new bool[2 * n];
        diag2 = new bool[2 * n];
        Backtrack(0);
        return count;
    }

    private void Backtrack(int row) {
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
            Backtrack(row + 1);
            cols[col] = false;
            diag1[d1] = false;
            diag2[d2] = false;
        }
    }
}
