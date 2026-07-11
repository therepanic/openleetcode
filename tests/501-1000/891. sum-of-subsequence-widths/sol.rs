impl Solution {
    pub fn sum_subseq_widths(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1000000007;
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        let mut ans: i64 = 0;
        let mut factor: i64 = 1;
        for i in 0..n {
            ans = (ans + (nums[i] as i64 - nums[n - 1 - i] as i64) * factor) % MOD;
            factor = (factor * 2) % MOD;
        }
        ans as i32
    }
}
