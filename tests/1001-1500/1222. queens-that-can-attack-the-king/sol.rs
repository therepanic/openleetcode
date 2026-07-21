impl Solution {
    pub fn queens_attackthe_king(queens: Vec<Vec<i32>>, king: Vec<i32>) -> Vec<Vec<i32>> {
        let mut board = [[false; 8]; 8];
        for q in queens {
            board[q[0] as usize][q[1] as usize] = true;
        }

        let directions = [
            (-1, 0), (1, 0), (0, 1), (0, -1),
            (-1, -1), (-1, 1), (1, -1), (1, 1),
        ];

        let mut ans = Vec::new();
        for (dr, dc) in directions {
            let mut r = king[0];
            let mut c = king[1];
            while r >= 0 && r < 8 && c >= 0 && c < 8 {
                r += dr;
                c += dc;
                if r < 0 || r >= 8 || c < 0 || c >= 8 {
                    break;
                }
                if board[r as usize][c as usize] {
                    ans.push(vec![r, c]);
                    break;
                }
            }
        }
        ans
    }
}
