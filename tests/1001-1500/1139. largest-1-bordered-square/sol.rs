impl Solution {
    pub fn largest1_bordered_square(grid: Vec<Vec<i32>>) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        let mut h = vec![vec![0; n]; m];
        let mut v = vec![vec![0; n]; m];
        for i in 0..m {
            for j in 0..n {
                if grid[i][j] == 1 {
                    h[i][j] = if j == 0 { 1 } else { h[i][j-1] + 1 };
                    v[i][j] = if i == 0 { 1 } else { v[i-1][j] + 1 };
                }
            }
        }
        let mut ans = 0;
        for i in 0..m {
            for j in 0..n {
                let sz = h[i][j].min(v[i][j]);
                for k in (1..=sz).rev() {
                    if h[i-k+1][j] >= k && v[i][j-k+1] >= k {
                        ans = ans.max(k);
                        break;
                    }
                }
            }
        }
        (ans * ans) as i32
    }
}
