impl Solution {
    pub fn min_skips(dist: Vec<i32>, speed: i32, hours_before: i32) -> i32 {
        let inf = 10i64.pow(18);
        let n = dist.len();
        let mut dp = vec![inf; n + 1];
        dp[0] = 0;
        for i in 0..n {
            let mut nxt = vec![inf; n + 1];
            let d = dist[i] as i64;
            for skips in 0..=i + 1 {
                if dp[skips] >= inf { continue; }
                nxt[skips + 1] = nxt[skips + 1].min(dp[skips] + d);
                let mut arrival = dp[skips] + d;
                if i != n - 1 {
                    arrival = ((arrival + speed as i64 - 1) / speed as i64) * speed as i64;
                }
                nxt[skips] = nxt[skips].min(arrival);
            }
            dp = nxt;
        }
        let limit = hours_before as i64 * speed as i64;
        for (skips, &v) in dp.iter().enumerate() {
            if v <= limit { return skips as i32; }
        }
        -1
    }
}
