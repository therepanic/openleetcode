impl Solution {
    pub fn total_n_queens(n: i32) -> i32 {
        let n = n as usize;
        let mut count = 0i32;
        let mut cols = vec![false; n];
        let mut diag1 = vec![false; 2 * n];
        let mut diag2 = vec![false; 2 * n];

        fn backtrack(
            row: usize,
            n: usize,
            cols: &mut Vec<bool>,
            diag1: &mut Vec<bool>,
            diag2: &mut Vec<bool>,
            count: &mut i32,
        ) {
            if row == n {
                *count += 1;
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
                backtrack(row + 1, n, cols, diag1, diag2, count);
                cols[col] = false;
                diag1[d1] = false;
                diag2[d2] = false;
            }
        }

        backtrack(0, n, &mut cols, &mut diag1, &mut diag2, &mut count);
        count
    }
}
