impl Solution {
    pub fn hit_bricks(grid: Vec<Vec<i32>>, hits: Vec<Vec<i32>>) -> Vec<i32> {
        let mut grid = grid;
        let m = grid.len();
        let n = grid[0].len();
        let mut parent: Vec<usize> = (0..m*n+1).collect();
        let mut rank = vec![1usize; m*n+1];
        
        fn find(parent: &mut Vec<usize>, p: usize) -> usize {
            if p != parent[p] {
                parent[p] = find(parent, parent[p]);
            }
            parent[p]
        }
        
        fn union(parent: &mut Vec<usize>, rank: &mut Vec<usize>, p: usize, q: usize) -> bool {
            let mut root_p = find(parent, p);
            let mut root_q = find(parent, q);
            if root_p == root_q {
                return false;
            }
            if rank[root_p] > rank[root_q] {
                std::mem::swap(&mut root_p, &mut root_q);
            }
            parent[root_p] = root_q;
            rank[root_q] += rank[root_p];
            true
        }
        
        let mut seen = std::collections::HashSet::new();
        for hit in &hits {
            let i = hit[0] as usize;
            let j = hit[1] as usize;
            if grid[i][j] == 1 {
                seen.insert(i * n + j);
                grid[i][j] = 0;
            }
        }
        
        for j in 0..n {
            if grid[0][j] == 1 {
                union(&mut parent, &mut rank, j, m * n);
            }
        }
        
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == 1 {
                    if i > 0 && grid[i-1][j] == 1 {
                        union(&mut parent, &mut rank, i * n + j, (i-1) * n + j);
                    }
                    if j > 0 && grid[i][j-1] == 1 {
                        union(&mut parent, &mut rank, i * n + j, i * n + j - 1);
                    }
                }
            }
        }
        
        let mut ans = vec![0i32; hits.len()];
        let mut prev_stable = rank[find(&mut parent, m * n)];
        let dirs = [(1i32, 0i32), (-1, 0), (0, 1), (0, -1)];
        
        for idx in (0..hits.len()).rev() {
            let i = hits[idx][0] as usize;
            let j = hits[idx][1] as usize;
            if seen.contains(&(i * n + j)) {
                grid[i][j] = 1;
                if i == 0 {
                    union(&mut parent, &mut rank, j, m * n);
                }
                for (di, dj) in &dirs {
                    let ii = i as i32 + di;
                    let jj = j as i32 + dj;
                    if ii >= 0 && ii < m as i32 && jj >= 0 && jj < n as i32 {
                        let ii = ii as usize;
                        let jj = jj as usize;
                        if grid[ii][jj] == 1 {
                            union(&mut parent, &mut rank, i * n + j, ii * n + jj);
                        }
                    }
                }
                let curr_stable = rank[find(&mut parent, m * n)];
                ans[idx] = std::cmp::max(0, curr_stable as i32 - prev_stable as i32 - 1);
                prev_stable = curr_stable;
            } else {
                ans[idx] = 0;
            }
        }
        
        ans
    }
}
