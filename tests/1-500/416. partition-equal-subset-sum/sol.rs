impl Solution {
    pub fn can_partition(nums: Vec<i32>) -> bool {
        let total_sum: i32 = nums.iter().sum();
        if total_sum % 2 != 0 {
            return false;
        }
        let target_sum = (total_sum / 2) as usize;
        let mut dp = vec![false; target_sum + 1];
        dp[0] = true;
        for &num in &nums {
            let num = num as usize;
            for curr_sum in (num..=target_sum).rev() {
                dp[curr_sum] = dp[curr_sum] || dp[curr_sum - num];
            }
        }
        dp[target_sum]
    }
}
