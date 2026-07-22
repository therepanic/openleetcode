impl Solution {
    pub fn min_cost(grid: Vec<Vec<i32>>) -> i32 {
        use std::collections::VecDeque;
        
        let m = grid.len();
        let n = grid[0].len();
        let mut min_cost = vec![vec![i32::MAX; n]; m];
        min_cost[0][0] = 0;
        
        let mut deque = VecDeque::new();
        deque.push_back((0, 0));
        
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)];
        
        while let Some((r, c)) = deque.pop_front() {
            for (i, &(dr, dc)) in directions.iter().enumerate() {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                let cost = if grid[r][c] != (i + 1) as i32 { 1 } else { 0 };
                
                if nr >= 0 && nr < m as i32 && nc >= 0 && nc < n as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if min_cost[r][c] + cost < min_cost[nr][nc] {
                        min_cost[nr][nc] = min_cost[r][c] + cost;
                        
                        if cost == 1 {
                            deque.push_back((nr, nc));
                        } else {
                            deque.push_front((nr, nc));
                        }
                    }
                }
            }
        }
        
        min_cost[m - 1][n - 1]
    }
}
