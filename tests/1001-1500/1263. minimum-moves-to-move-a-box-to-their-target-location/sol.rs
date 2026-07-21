impl Solution {
    pub fn min_push_box(grid: Vec<Vec<char>>) -> i32 {
        let rows = grid.len();
        let cols = grid[0].len();
        let mut player = (0, 0);
        let mut box_pos = (0, 0);
        let mut target = (0, 0);
        
        for i in 0..rows {
            for j in 0..cols {
                match grid[i][j] {
                    'S' => player = (i, j),
                    'B' => box_pos = (i, j),
                    'T' => target = (i, j),
                    _ => {}
                }
            }
        }
        
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
        use std::collections::{VecDeque, HashSet};
        
        let mut q = VecDeque::new();
        q.push_back((box_pos, player, 0));
        let mut seen = HashSet::new();
        seen.insert((box_pos, player));
        
        while let Some((b, p, pushes)) = q.pop_front() {
            if b == target {
                return pushes;
            }
            
            let mut reachable = HashSet::new();
            reachable.insert(p);
            let mut walk = VecDeque::new();
            walk.push_back(p);
            
            while let Some((x, y)) = walk.pop_front() {
                for (dx, dy) in &dirs {
                    let nx = x as i32 + dx;
                    let ny = y as i32 + dy;
                    if nx >= 0 && nx < rows as i32 && ny >= 0 && ny < cols as i32 {
                        let np = (nx as usize, ny as usize);
                        if np != b && grid[np.0][np.1] != '#' && !reachable.contains(&np) {
                            reachable.insert(np);
                            walk.push_back(np);
                        }
                    }
                }
            }
            
            for (dx, dy) in &dirs {
                let nbx = b.0 as i32 + dx;
                let nby = b.1 as i32 + dy;
                let behind_x = b.0 as i32 - dx;
                let behind_y = b.1 as i32 - dy;
                
                if nbx >= 0 && nbx < rows as i32 && nby >= 0 && nby < cols as i32 {
                    let nb = (nbx as usize, nby as usize);
                    let behind = (behind_x as usize, behind_y as usize);
                    
                    if grid[nb.0][nb.1] != '#' && reachable.contains(&behind) && !seen.contains(&(nb, b)) {
                        seen.insert((nb, b));
                        q.push_back((nb, b, pushes + 1));
                    }
                }
            }
        }
        -1
    }
}
