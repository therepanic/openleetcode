impl Solution {
    pub fn num_music_playlists(n: i32, goal: i32, k: i32) -> i32 {
        const MOD: i64 = 1000000007;
        let n = n as usize;
        let goal = goal as usize;
        let k = k as usize;
        let mut dp = vec![vec![0i64; n + 1]; 2];
        dp[0][0] = 1;

        for i in 1..=goal {
            dp[i % 2][0] = 0;
            let limit = i.min(n);
            for j in 1..=limit {
                dp[i % 2][j] = dp[(i - 1) % 2][j - 1] * (n - (j - 1)) as i64 % MOD;
                if j > k {
                    dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k) as i64) % MOD;
                }
            }
        }

        dp[goal % 2][n] as i32
    }
}
