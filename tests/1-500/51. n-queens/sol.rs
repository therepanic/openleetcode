impl Solution {
    pub fn solve_n_queens(n: i32) -> Vec<Vec<String>> {
        let n = n as usize;
        let mut res = Vec::new();
        let mut board = vec![vec!['.'; n]; n];
        let mut cols = vec![false; n];
        let mut diag1 = vec![false; 2 * n];
        let mut diag2 = vec![false; 2 * n];

        fn backtrack(
            row: usize,
            n: usize,
            board: &mut Vec<Vec<char>>,
            cols: &mut Vec<bool>,
            diag1: &mut Vec<bool>,
            diag2: &mut Vec<bool>,
            res: &mut Vec<Vec<String>>,
        ) {
            if row == n {
                res.push(board.iter().map(|r| r.iter().collect::<String>()).collect());
                return;
            }
            for col in 0..n {
                let d1 = row + col;
                let d2 = row + n - 1 - col;
                if cols[col] || diag1[d1] || diag2[d2] {
                    continue;
                }
                cols[col] = true;
                diag1[d1] = true;
                diag2[d2] = true;
                board[row][col] = 'Q';
                backtrack(row + 1, n, board, cols, diag1, diag2, res);
                board[row][col] = '.';
                cols[col] = false;
                diag1[d1] = false;
                diag2[d2] = false;
            }
        }

        backtrack(0, n, &mut board, &mut cols, &mut diag1, &mut diag2, &mut res);
        res
    }
}
