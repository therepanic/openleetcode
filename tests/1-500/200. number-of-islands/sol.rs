use std::collections::VecDeque;

impl Solution {
    pub fn num_islands(mut grid: Vec<Vec<String>>) -> i32 {
        let rows = grid.len();
        let cols = grid[0].len();
        let mut islands = 0;
        let directions = [(1_i32, 0_i32), (-1, 0), (0, 1), (0, -1)];

        for r in 0..rows {
            for c in 0..cols {
                if grid[r][c] != "1" {
                    continue;
                }
                islands += 1;
                let mut queue = VecDeque::new();
                queue.push_back((r, c));
                grid[r][c] = "0".to_string();
                while let Some((row, col)) = queue.pop_front() {
                    for &(dr, dc) in &directions {
                        let nr = row as i32 + dr;
                        let nc = col as i32 + dc;
                        if nr >= 0
                            && nr < rows as i32
                            && nc >= 0
                            && nc < cols as i32
                            && grid[nr as usize][nc as usize] == "1"
                        {
                            grid[nr as usize][nc as usize] = "0".to_string();
                            queue.push_back((nr as usize, nc as usize));
                        }
                    }
                }
            }
        }

        islands
    }
}
