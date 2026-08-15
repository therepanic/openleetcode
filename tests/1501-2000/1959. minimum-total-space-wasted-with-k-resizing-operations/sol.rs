impl Solution {
    pub fn min_space_wasted_k_resizing(nums: Vec<i32>, k: i32) -> i32 {
        let n = nums.len();
        let mut p = vec![0; n + 1];
        for i in 0..n {
            p[i+1] = p[i] + nums[i];
        }
        let inf = 1_000_000_000i32;
        let mut dp = vec![inf; n + 1];
        dp[0] = 0;
        let mut max_v = 0;
        for i in 1..=n {
            max_v = max_v.max(nums[i-1]);
            dp[i] = max_v * i as i32 - p[i];
        }
        for _ in 0..k {
            let mut new_dp = vec![inf; n + 1];
            new_dp[0] = 0;
            for i in 1..=n {
                let mut cur_max = 0;
                for j in (0..i).rev() {
                    cur_max = cur_max.max(nums[j]);
                    let waste = cur_max * (i as i32 - j as i32) - (p[i] - p[j]);
                    if dp[j] != i32::MAX {
                    if dp[j] != inf { new_dp[i] = new_dp[i].min(dp[j] + waste); }
                    }
                }
            }
            dp = new_dp;
        }
        dp[n]
    }
}
