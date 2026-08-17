impl Solution {
    pub fn first_day_been_in_all_rooms(next_visit: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = next_visit.len();
        let mut dp = vec![0i64; n];

        for i in 1..n {
            dp[i] = (2 * dp[i-1] - dp[next_visit[i-1] as usize] + 2 + MOD) % MOD;
        }
        
        dp[n-1] as i32
    }
}
