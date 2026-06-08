impl Solution {
    pub fn is_valid_sudoku(board: Vec<Vec<char>>) -> bool {
        let mut rows = [[false; 9]; 9];
        let mut cols = [[false; 9]; 9];
        let mut boxes = [[false; 9]; 9];

        for i in 0..9 {
            for j in 0..9 {
                let ch = board[i][j];
                if ch == '.' {
                    continue;
                }
                let num = (ch as u8 - b'1') as usize;
                let box_idx = (i / 3) * 3 + (j / 3);
                if rows[i][num] || cols[j][num] || boxes[box_idx][num] {
                    return false;
                }
                rows[i][num] = true;
                cols[j][num] = true;
                boxes[box_idx][num] = true;
            }
        }

        true
    }
}
