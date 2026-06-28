impl Solution {
    pub fn moves_to_chessboard(board: Vec<Vec<i32>>) -> i32 {
        let n = board.len();
        
        let fn_vals = |vals: &[i32]| -> i32 {
            let mut total = 0;
            let mut odd = 0;
            for i in 0..vals.len() {
                if vals[0] == vals[i] {
                    total += 1;
                    if i & 1 == 1 {
                        odd += 1;
                    }
                } else if vals[0] ^ vals[i] != (1 << n) - 1 {
                    return i32::MAX / 2;
                }
            }
            let mut ans = i32::MAX / 2;
            if (n as i32) <= 2 * total && 2 * total <= (n as i32) + 1 {
                ans = ans.min(odd);
            }
            if (n as i32) - 1 <= 2 * total && 2 * total <= (n as i32) {
                ans = ans.min(total - odd);
            }
            ans
        };
        
        let mut rows = vec![0; n];
        let mut cols = vec![0; n];
        for i in 0..n {
            for j in 0..n {
                if board[i][j] == 1 {
                    rows[i] ^= 1 << j;
                    cols[j] ^= 1 << i;
                }
            }
        }
        let ans = fn_vals(&rows) + fn_vals(&cols);
        if ans >= i32::MAX / 2 { -1 } else { ans }
    }
}
