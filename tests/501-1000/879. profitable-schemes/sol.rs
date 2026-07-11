impl Solution {
    pub fn profitable_schemes(n: i32, min_profit: i32, group: Vec<i32>, profit: Vec<i32>) -> i32 {
        let mod_val = 1_000_000_007;
        let n = n as usize;
        let min_profit = min_profit as usize;
        let mut dp = vec![vec![0; min_profit + 1]; n + 1];
        dp[0][0] = 1;
        for k in 1..=group.len() {
            let g = group[k - 1] as usize;
            let p = profit[k - 1] as usize;
            for i in (g..=n).rev() {
                for j in (0..=min_profit).rev() {
                    let prev = if j >= p { dp[i - g][j - p] } else { dp[i - g][0] };
                    dp[i][j] = (dp[i][j] + prev) % mod_val;
                }
            }
        }
        let mut ans = 0;
        for i in 0..=n {
            ans = (ans + dp[i][min_profit]) % mod_val;
        }
        ans
    }
}
