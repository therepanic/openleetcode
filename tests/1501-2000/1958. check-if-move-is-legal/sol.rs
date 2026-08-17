impl Solution {
    pub fn check_move(board: Vec<Vec<char>>, r_move: i32, c_move: i32, color: char) -> bool {
        let opposite = if color == 'B' { 'W' } else { 'B' };
        let dirs = [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)];

        for (dr, dc) in dirs.iter() {
            let mut r = r_move + dr;
            let mut c = c_move + dc;
            let mut cnt = 0;

            while r >= 0 && r < 8 && c >= 0 && c < 8 && board[r as usize][c as usize] == opposite {
                r += dr;
                c += dc;
                cnt += 1;
            }

            if cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r as usize][c as usize] == color {
                return true;
            }
        }

        false
    }
}
