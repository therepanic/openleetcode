use std::collections::{VecDeque, HashSet};

impl Solution {
    pub fn num_enclaves(grid: Vec<Vec<i32>>) -> i32 {
        let total: i32 = grid.iter().map(|row| row.iter().sum::<i32>()).sum();
        let m = grid.len();
        let n = grid[0].len();
        if m == 1 || n == 1 {
            return 0;
        }
        
        let mut q: VecDeque<(usize, usize)> = VecDeque::new();
        let mut seen: HashSet<(usize, usize)> = HashSet::new();
        
        for i in 0..n {
            if grid[0][i] == 1 {
                q.push_back((0, i));
                seen.insert((0, i));
            }
            if grid[m-1][i] == 1 {
                q.push_back((m-1, i));
                seen.insert((m-1, i));
            }
        }
        for i in 1..m-1 {
            if grid[i][0] == 1 {
                q.push_back((i, 0));
                seen.insert((i, 0));
            }
            if grid[i][n-1] == 1 {
                q.push_back((i, n-1));
                seen.insert((i, n-1));
            }
        }
        
        let directions = [(0,1), (1,0), (0,-1), (-1,0)];
        let mut next_total = 0;
        
        while let Some((x, y)) = q.pop_front() {
            next_total += 1;
            
            for &(dx, dy) in &directions {
                let nx = x as isize + dx;
                let ny = y as isize + dy;
                if nx >= 0 && nx < m as isize && ny >= 0 && ny < n as isize {
                    let nx = nx as usize;
                    let ny = ny as usize;
                    if grid[nx][ny] == 1 && !seen.contains(&(nx, ny)) {
                        q.push_back((nx, ny));
                        seen.insert((nx, ny));
                    }
                }
            }
        }
        
        total - next_total
    }
}
