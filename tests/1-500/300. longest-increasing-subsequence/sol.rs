impl Solution {
    pub fn length_of_lis(nums: Vec<i32>) -> i32 {
        let prev_idx = -1;
        let mut dp = vec![vec![-1; 2500]; 2500];
        Self::helper(0, prev_idx, &nums, &mut dp)
    }

    fn helper(i: usize, prev_idx: i32, nums: &Vec<i32>, dp: &mut Vec<Vec<i32>>) -> i32 {
        if i >= nums.len() {
            return 0;
        }
        let idx = (prev_idx + 1) as usize;
        if dp[i][idx] != -1 {
            return dp[i][idx];
        }
        let mut steal = 0;
        let mut skip = 0;
        if prev_idx == -1 || nums[prev_idx as usize] < nums[i] {
            steal = 1 + Self::helper(i + 1, i as i32, nums, dp);
        }
        skip = Self::helper(i + 1, prev_idx, nums, dp);
        dp[i][idx] = steal.max(skip);
        steal.max(skip)
    }
}
