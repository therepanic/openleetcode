impl Solution {
    pub fn count_battleships(board: Vec<Vec<String>>) -> i32 {
        let mut count = 0;
        for i in 0..board.len() {
            for j in 0..board[0].len() {
                if board[i][j] == "X" &&
                    (i == 0 || board[i-1][j] == ".") &&
                    (j == 0 || board[i][j-1] == ".") {
                    count += 1;
                }
            }
        }
        count
    }
}
