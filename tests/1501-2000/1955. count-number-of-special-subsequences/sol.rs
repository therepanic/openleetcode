impl Solution {
    pub fn count_special_subsequences(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let mut dp0: i64 = 0;
        let mut dp1: i64 = 0;
        let mut dp2: i64 = 0;
        for &x in nums.iter() {
            if x == 0 {
                dp0 = (2 * dp0 + 1) % MOD;
            } else if x == 1 {
                dp1 = (2 * dp1 + dp0) % MOD;
            } else {
                dp2 = (2 * dp2 + dp1) % MOD;
            }
        }
        dp2 as i32
    }
}
