impl Solution {
    pub fn shortest_path_all_keys(grid: Vec<String>) -> i32 {
        use std::collections::VecDeque;
        
        let m = grid.len();
        let n = grid[0].len();
        let mut start_i = 0;
        let mut start_j = 0;
        let mut total_keys = 0;
        
        let grid: Vec<Vec<char>> = grid.iter().map(|s| s.chars().collect()).collect();
        
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == '@' {
                    start_i = i;
                    start_j = j;
                }
                if grid[i][j] >= 'a' && grid[i][j] <= 'f' {
                    total_keys += 1;
                }
            }
        }
        
        let target_mask = (1 << total_keys) - 1;
        let mut queue = VecDeque::new();
        queue.push_back((start_i, start_j, 0));
        let mut seen = vec![vec![vec![false; 1 << total_keys]; n]; m];
        seen[start_i][start_j][0] = true;
        let mut moves = 0;
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)];
        
        while !queue.is_empty() {
            let size = queue.len();
            for _ in 0..size {
                let (r, c, mask) = queue.pop_front().unwrap();
                
                if mask == target_mask {
                    return moves;
                }
                
                for (dx, dy) in &dirs {
                    let nr = r as i32 + dx;
                    let nc = c as i32 + dy;
                    
                    if nr < 0 || nr >= m as i32 || nc < 0 || nc >= n as i32 {
                        continue;
                    }
                    
                    let nr = nr as usize;
                    let nc = nc as usize;
                    let next_val = grid[nr][nc];
                    let mut next_mask = mask;
                    
                    if next_val >= 'a' && next_val <= 'f' {
                        let key_bit = (next_val as u8 - b'a') as usize;
                        next_mask |= 1 << key_bit;
                    }
                    
                    if next_val >= 'A' && next_val <= 'F' {
                        let lock_bit = (next_val.to_ascii_lowercase() as u8 - b'a') as usize;
                        if (next_mask & (1 << lock_bit)) == 0 {
                            continue;
                        }
                    }
                    
                    if !seen[nr][nc][next_mask] && next_val != '#' {
                        queue.push_back((nr, nc, next_mask));
                        seen[nr][nc][next_mask] = true;
                    }
                }
            }
            moves += 1;
        }
        
        -1
    }
}
