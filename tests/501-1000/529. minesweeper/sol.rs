impl Solution {
    pub fn update_board(board: Vec<Vec<char>>, click: Vec<i32>) -> Vec<Vec<char>> {
        let mut board = board;
        let directions = [
            (-1, -1), (-1, 0), (-1, 1),
            (0, -1), (0, 1),
            (1, -1), (1, 0), (1, 1)
        ];
        let rows = board.len() as i32;
        let cols = board[0].len() as i32;
        let r = click[0];
        let c = click[1];

        if board[r as usize][c as usize] == 'M' {
            board[r as usize][c as usize] = 'X';
            return board;
        }

        fn count_mines(board: &Vec<Vec<char>>, r: i32, c: i32, directions: &[(i32, i32)], rows: i32, cols: i32) -> i32 {
            let mut count = 0;
            for &(dr, dc) in directions {
                let nr = r + dr;
                let nc = c + dc;
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr as usize][nc as usize] == 'M' {
                    count += 1;
                }
            }
            count
        }

        fn reveal(board: &mut Vec<Vec<char>>, r: i32, c: i32, directions: &[(i32, i32)], rows: i32, cols: i32) {
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r as usize][c as usize] != 'E' {
                return;
            }
            let mines = count_mines(board, r, c, directions, rows, cols);
            if mines > 0 {
                board[r as usize][c as usize] = std::char::from_digit(mines as u32, 10).unwrap();
            } else {
                board[r as usize][c as usize] = 'B';
                for &(dr, dc) in directions {
                    reveal(board, r + dr, c + dc, directions, rows, cols);
                }
            }
        }

        reveal(&mut board, r, c, &directions, rows, cols);
        board
    }
}
