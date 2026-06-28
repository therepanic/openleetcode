impl Solution {
    pub fn valid_tic_tac_toe(board: Vec<String>) -> bool {
        let count_x: usize = board.iter().map(|row| row.chars().filter(|&c| c == 'X').count()).sum();
        let count_o: usize = board.iter().map(|row| row.chars().filter(|&c| c == 'O').count()).sum();
        
        if count_o > count_x || count_x > count_o + 1 {
            return false;
        }
        
        let is_winner = |player: char| -> bool {
            let b: Vec<Vec<char>> = board.iter().map(|row| row.chars().collect()).collect();
            for i in 0..3 {
                if (0..3).all(|j| b[i][j] == player) { return true; }
                if (0..3).all(|j| b[j][i] == player) { return true; }
            }
            if b[0][0] == player && b[1][1] == player && b[2][2] == player { return true; }
            if b[0][2] == player && b[1][1] == player && b[2][0] == player { return true; }
            false
        };
        
        let x_wins = is_winner('X');
        let o_wins = is_winner('O');
        
        if x_wins && o_wins { return false; }
        if x_wins && count_x != count_o + 1 { return false; }
        if o_wins && count_x != count_o { return false; }
        
        true
    }
}
