impl Solution {
    pub fn largest_divisible_subset(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        let mut dp = vec![1; n];
        let mut prev = vec![-1; n];
        let mut maxi = 0;
        for i in 1..n {
            for j in 0..i {
                if nums[i] % nums[j] == 0 && dp[i] < dp[j] + 1 {
                    dp[i] = dp[j] + 1;
                    prev[i] = j as i32;
                }
            }
            if dp[i] > dp[maxi] {
                maxi = i;
            }
        }
        let mut res = Vec::new();
        let mut i = maxi as i32;
        while i >= 0 {
            res.push(nums[i as usize]);
            i = prev[i as usize];
        }
        res.reverse();
        res
    }
}
