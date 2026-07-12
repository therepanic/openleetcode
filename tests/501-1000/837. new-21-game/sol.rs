impl Solution {
    pub fn new21_game(n: i32, k: i32, max_pts: i32) -> f64 {
        if k == 0 || n >= k - 1 + max_pts {
            return 1.0;
        }

        let max_pts = max_pts as usize;
        let n = n as usize;
        let k = k as usize;

        let mut dp = vec![0.0; max_pts];
        dp[0] = 1.0;

        let mut window_sum = 1.0;
        let mut result = 0.0;

        for i in 1..=n {
            let prob = window_sum / max_pts as f64;

            if i < k {
                window_sum += prob;
            } else {
                result += prob;
            }

            if i >= max_pts {
                window_sum -= dp[i % max_pts];
            }

            dp[i % max_pts] = prob;
        }

        result
    }
}
