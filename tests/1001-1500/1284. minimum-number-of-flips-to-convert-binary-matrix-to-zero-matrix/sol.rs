use std::collections::VecDeque;

impl Solution {
    pub fn min_flips(mat: Vec<Vec<i32>>) -> i32 {
        let m = mat.len();
        let n = mat[0].len();
        let mut masks = Vec::with_capacity(m * n);

        for r in 0..m {
            for c in 0..n {
                let mut mask = 0usize;
                for (dr, dc) in [(0isize, 0isize), (1, 0), (-1, 0), (0, 1), (0, -1)] {
                    let nr = r as isize + dr;
                    let nc = c as isize + dc;
                    if nr >= 0 && nr < m as isize && nc >= 0 && nc < n as isize {
                        mask |= 1usize << (nr as usize * n + nc as usize);
                    }
                }
                masks.push(mask);
            }
        }

        let mut start = 0usize;
        for r in 0..m {
            for c in 0..n {
                if mat[r][c] == 1 {
                    start |= 1usize << (r * n + c);
                }
            }
        }

        let size = 1usize << (m * n);
        let mut dist = vec![-1i32; size];
        let mut q = VecDeque::new();
        dist[start] = 0;
        q.push_back(start);

        while let Some(state) = q.pop_front() {
            let steps = dist[state];
            if state == 0 {
                return steps;
            }
            for &mask in &masks {
                let next = state ^ mask;
                if dist[next] == -1 {
                    dist[next] = steps + 1;
                    q.push_back(next);
                }
            }
        }

        -1
    }
}
