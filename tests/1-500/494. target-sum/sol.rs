impl Solution {
    pub fn find_target_sum_ways(nums: Vec<i32>, target: i32) -> i32 {
        let total: i32 = nums.iter().sum();
        if target.abs() > total || (target + total) % 2 != 0 {
            return 0;
        }
        let sum = ((target + total) / 2) as usize;
        let mut dp = vec![0; sum + 1];
        dp[0] = 1;

        for &num in nums.iter() {
            for j in (num as usize..=sum).rev() {
                dp[j] += dp[j - num as usize];
            }
        }

        dp[sum]
    }
}
