use std::collections::VecDeque;

impl Solution {
    pub fn max_result(nums: Vec<i32>, k: i32) -> i32 {
        let n = nums.len();
        let mut dp = vec![0; n];
        dp[0] = nums[0];
        let mut dq = VecDeque::from([0usize]);
        let k = k as usize;
        for i in 1..n {
            while let Some(&front) = dq.front() {
                if front + k < i {
                    dq.pop_front();
                } else {
                    break;
                }
            }
            dp[i] = nums[i] + dp[*dq.front().unwrap()];
            while let Some(&back) = dq.back() {
                if dp[back] <= dp[i] {
                    dq.pop_back();
                } else {
                    break;
                }
            }
            dq.push_back(i);
        }
        dp[n - 1]
    }
}
