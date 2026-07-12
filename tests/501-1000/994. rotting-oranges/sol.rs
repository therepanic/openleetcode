impl Solution {
    pub fn oranges_rotting(grid: Vec<Vec<i32>>) -> i32 {
        let mut grid = grid;
        let n = grid.len();
        let m = grid[0].len();
        use std::collections::VecDeque;
        let mut q: VecDeque<(usize, usize, i32)> = VecDeque::new();
        let mut fresh = 0;

        for i in 0..n {
            for j in 0..m {
                if grid[i][j] == 2 {
                    q.push_back((i, j, 0));
                } else if grid[i][j] == 1 {
                    fresh += 1;
                }
            }
        }

        let directions = [(-1,0),(1,0),(0,-1),(0,1)];
        let mut max_time = 0;
        let mut rotten = 0;

        while let Some((r, c, t)) = q.pop_front() {
            if t > max_time { max_time = t; }

            for (dr, dc) in directions.iter() {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                if nr >= 0 && nr < n as i32 && nc >= 0 && nc < m as i32 {
                    let (nr, nc) = (nr as usize, nc as usize);
                    if grid[nr][nc] == 1 {
                        grid[nr][nc] = 2;
                        q.push_back((nr, nc, t + 1));
                        rotten += 1;
                    }
                }
            }
        }

        if rotten == fresh { max_time } else { -1 }
    }
}
