impl Solution {
    pub fn shortest_path(grid: Vec<Vec<i32>>, k: i32) -> i32 {
        let n = grid.len();
        let m = grid[0].len();
        let mut q = std::collections::VecDeque::new();
        q.push_back((0, 0, k, 0));
        let mut visi = std::collections::HashSet::new();
        visi.insert((0, 0, k));
        let dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)];
        while let Some((r, c, k_rem, d)) = q.pop_front() {
            if r == n - 1 && c == m - 1 {
                return d;
            }
            let mut new_k = k_rem;
            if grid[r][c] == 1 {
                new_k -= 1;
            }
            for (dr, dc) in dirs {
                let nr = r as i32 + dr;
                let nc = c as i32 + dc;
                if nr >= 0 && nr < n as i32 && nc >= 0 && nc < m as i32 {
                    let nr = nr as usize;
                    let nc = nc as usize;
                    if !visi.contains(&(nr, nc, new_k)) && new_k >= 0 {
                        visi.insert((nr, nc, new_k));
                        q.push_back((nr, nc, new_k, d + 1));
                    }
                }
            }
        }
        -1
    }
}
