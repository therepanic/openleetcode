impl Solution {
    pub fn order_of_largest_plus_sign(n: i32, mines: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut s = std::collections::HashSet::new();
        for mine in &mines {
            s.insert(mine[0] as usize * n + mine[1] as usize);
        }
        let mut dp = vec![vec![n; n]; n];
        
        for i in 0..n {
            let mut count = 0;
            for j in 0..n {
                if s.contains(&(i * n + j)) {
                    count = 0;
                } else {
                    count += 1;
                }
                dp[i][j] = dp[i][j].min(count);
            }
            count = 0;
            for j in (0..n).rev() {
                if s.contains(&(i * n + j)) {
                    count = 0;
                } else {
                    count += 1;
                }
                dp[i][j] = dp[i][j].min(count);
            }
        }
        
        for j in 0..n {
            let mut count = 0;
            for i in 0..n {
                if s.contains(&(i * n + j)) {
                    count = 0;
                } else {
                    count += 1;
                }
                dp[i][j] = dp[i][j].min(count);
            }
            count = 0;
            for i in (0..n).rev() {
                if s.contains(&(i * n + j)) {
                    count = 0;
                } else {
                    count += 1;
                }
                dp[i][j] = dp[i][j].min(count);
            }
        }
        
        let mut ans = 0;
        for i in 0..n {
            for j in 0..n {
                ans = ans.max(dp[i][j]);
            }
        }
        ans as i32
    }
}
