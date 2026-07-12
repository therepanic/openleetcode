impl Solution {
    pub fn snakes_and_ladders(board: Vec<Vec<i32>>) -> i32 {
        use std::collections::VecDeque;
        
        let n = board.len();
        let mut min_rolls = vec![-1; n * n + 1];
        let mut q = VecDeque::new();
        min_rolls[1] = 0;
        q.push_back(1);

        while let Some(x) = q.pop_front() {
            for i in 1..=6 {
                let t = x + i;
                if t > (n * n) as i32 {
                    break;
                }
                let row = ((t - 1) as usize) / n;
                let col = ((t - 1) as usize) % n;
                let r = n - 1 - row;
                let c = if row % 2 == 1 { n - 1 - col } else { col };
                let v = board[r][c];
                let y = if v > 0 { v } else { t };
                if y == (n * n) as i32 {
                    return min_rolls[x as usize] + 1;
                }
                if min_rolls[y as usize] == -1 {
                    min_rolls[y as usize] = min_rolls[x as usize] + 1;
                    q.push_back(y);
                }
            }
        }
        -1
    }
}
