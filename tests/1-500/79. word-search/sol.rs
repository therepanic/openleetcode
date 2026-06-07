impl Solution {
    pub fn exist(board: Vec<Vec<char>>, word: String) -> bool {
        if board.is_empty() || board[0].is_empty() {
            return false;
        }
        let mut board = board;
        let word: Vec<char> = word.chars().collect();
        let rows = board.len() as i32;
        let cols = board[0].len() as i32;

        fn dfs(board: &mut Vec<Vec<char>>, word: &Vec<char>, rows: i32, cols: i32, r: i32, c: i32, idx: usize) -> bool {
            if idx == word.len() {
                return true;
            }
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r as usize][c as usize] != word[idx] {
                return false;
            }
            let ur = r as usize;
            let uc = c as usize;
            let saved = board[ur][uc];
            board[ur][uc] = '#';
            let found = dfs(board, word, rows, cols, r + 1, c, idx + 1)
                || dfs(board, word, rows, cols, r - 1, c, idx + 1)
                || dfs(board, word, rows, cols, r, c + 1, idx + 1)
                || dfs(board, word, rows, cols, r, c - 1, idx + 1);
            board[ur][uc] = saved;
            found
        }

        for r in 0..rows {
            for c in 0..cols {
                if board[r as usize][c as usize] == word[0] && dfs(&mut board, &word, rows, cols, r, c, 0) {
                    return true;
                }
            }
        }
        false
    }
}
