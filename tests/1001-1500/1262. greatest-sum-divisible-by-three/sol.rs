impl Solution {
    pub fn max_sum_div_three(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let minus = -(1i32 << 30);
        let mut dp = vec![vec![0, 0, 0], vec![0, minus, minus]];
        for (i, &x) in nums.iter().enumerate() {
            let x3 = x % 3;
            for mod_val in 0..3 {
                let mod_prev = (3 + mod_val - x3 as usize) % 3;
                let take = x + dp[(i + 1) & 1][mod_prev];
                let skip = dp[(i + 1) & 1][mod_val];
                dp[i & 1][mod_val] = take.max(skip);
            }
        }
        dp[(n - 1) & 1][0].max(0)
    }
}
