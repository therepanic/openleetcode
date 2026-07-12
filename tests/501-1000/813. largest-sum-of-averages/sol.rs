impl Solution {
    pub fn largest_sum_of_averages(nums: Vec<i32>, k: i32) -> f64 {
        let n = nums.len();
        let k = k as usize;
        let mut pref = vec![0i32; n+1];
        for i in 0..n {
            pref[i+1] = pref[i] + nums[i];
        }
        let mut dp = vec![vec![0.0f64; k+1]; n+1];
        for i in 1..=n {
            dp[i][1] = pref[i] as f64 / i as f64;
        }
        for p in 2..=k {
            for i in p..=n {
                let mut best = 0.0f64;
                for j in (p-1)..i {
                    let val = dp[j][p-1] + (pref[i] - pref[j]) as f64 / (i - j) as f64;
                    if val > best { best = val; }
                }
                dp[i][p] = best;
            }
        }
        dp[n][k]
    }
}
