impl Solution {
    pub fn island_perimeter(grid: Vec<Vec<i32>>) -> i32 {
        use std::collections::{HashSet, VecDeque};
        
        let rows = grid.len();
        let cols = grid[0].len();
        let mut visited = HashSet::new();
        
        let mut start_r = 0;
        let mut start_c = 0;
        'outer: for r in 0..rows {
            for c in 0..cols {
                if grid[r][c] == 1 {
                    start_r = r;
                    start_c = c;
                    break 'outer;
                }
            }
        }
        
        let mut queue = VecDeque::new();
        queue.push_back((start_r, start_c));
        visited.insert((start_r, start_c));
        let mut perimeter = 0;
        
        let dirs = [(1,0),(-1,0),(0,1),(0,-1)];
        
        while let Some((r, c)) = queue.pop_front() {
            for (dr, dc) in &dirs {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                
                if nr < 0 || nr >= rows as i32 || nc < 0 || nc >= cols as i32 || grid[nr as usize][nc as usize] == 0 {
                    perimeter += 1;
                } else {
                    let pos = (nr as usize, nc as usize);
                    if !visited.contains(&pos) {
                        visited.insert(pos);
                        queue.push_back(pos);
                    }
                }
            }
        }
        
        perimeter
    }
}
