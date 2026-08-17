impl Solution {
    pub fn minimum_effort_path(heights: Vec<Vec<i32>>) -> i32 {
        if heights.is_empty() {
            return 0;
        }
        let rows = heights.len();
        let cols = heights[0].len();
        use std::collections::BinaryHeap;
        use std::cmp::Reverse;
        let mut pq: BinaryHeap<Reverse<(i32, usize, usize)>> = BinaryHeap::new();
        pq.push(Reverse((0, 0, 0)));
        let mut max_effort = 0;
        let mut visited = vec![vec![false; cols]; rows];
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
        while let Some(Reverse((effort, r, c))) = pq.pop() {
            max_effort = max_effort.max(effort);
            if r == rows - 1 && c == cols - 1 {
                return max_effort;
            }
            if visited[r][c] {
                continue;
            }
            visited[r][c] = true;
            for &(dr, dc) in &dirs {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                if nr >= 0 && nr < rows as i32 && nc >= 0 && nc < cols as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if !visited[nr][nc] {
                        let new_effort = (heights[nr][nc] - heights[r][c]).abs();
                        pq.push(Reverse((new_effort, nr, nc)));
                    }
                }
            }
        }
        max_effort
    }
}
