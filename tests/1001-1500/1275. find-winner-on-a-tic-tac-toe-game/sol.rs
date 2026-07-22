impl Solution {
    pub fn tictactoe(moves: Vec<Vec<i32>>) -> String {
        let mut board = vec![vec![String::new(); 3]; 3];
        let mut is_a = true;
        for mv in &moves {
            let r = mv[0] as usize;
            let c = mv[1] as usize;
            board[r][c] = if is_a { "X".to_string() } else { "O".to_string() };
            is_a = !is_a;
        }

        for i in 0..3 {
            if !board[i][0].is_empty() && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
                return if board[i][0] == "X" { "A".to_string() } else { "B".to_string() };
            }
            if !board[0][i].is_empty() && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
                return if board[0][i] == "X" { "A".to_string() } else { "B".to_string() };
            }
        }

        if !board[1][1].is_empty() && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0])) {
            return if board[1][1] == "X" { "A".to_string() } else { "B".to_string() };
        }

        if moves.len() == 9 { "Draw".to_string() } else { "Pending".to_string() }
    }
}
