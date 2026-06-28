impl Solution {
    pub fn cut_off_tree(forest: Vec<Vec<i32>>) -> i32 {
        let rows = forest.len();
        let cols = forest[0].len();
        
        if forest[0][0] == 0 {
            return -1;
        }
        
        let mut trees: Vec<(i32, usize, usize)> = Vec::new();
        for r in 0..rows {
            for c in 0..cols {
                if forest[r][c] > 1 {
                    trees.push((forest[r][c], r, c));
                }
            }
        }
        
        trees.sort_by(|a, b| a.0.cmp(&b.0));
        
        let find_shortest_path = |start_row: usize, start_col: usize, 
                                   target_row: usize, target_col: usize| -> i32 {
            let directions = [(-1, 0), (0, -1), (0, 1), (1, 0)];
            let mut queue = std::collections::VecDeque::new();
            let mut visited = vec![vec![false; cols]; rows];
            
            queue.push_back((start_row, start_col, 0));
            visited[start_row][start_col] = true;
            
            while let Some((curr_row, curr_col, steps)) = queue.pop_front() {
                if curr_row == target_row && curr_col == target_col {
                    return steps;
                }
                
                for (dr, dc) in directions.iter() {
                    let new_row = curr_row as i32 + dr;
                    let new_col = curr_col as i32 + dc;
                    
                    if new_row >= 0 && new_row < rows as i32 && 
                       new_col >= 0 && new_col < cols as i32 {
                        let nr = new_row as usize;
                        let nc = new_col as usize;
                        
                        if forest[nr][nc] > 0 && !visited[nr][nc] {
                            queue.push_back((nr, nc, steps + 1));
                            visited[nr][nc] = true;
                        }
                    }
                }
            }
            
            -1
        };
        
        let mut total_steps = 0;
        let mut current_row = 0;
        let mut current_col = 0;
        
        for (_, target_row, target_col) in trees {
            let steps = find_shortest_path(current_row, current_col, target_row, target_col);
            if steps == -1 {
                return -1;
            }
            total_steps += steps;
            current_row = target_row;
            current_col = target_col;
        }
        
        total_steps
    }
}
