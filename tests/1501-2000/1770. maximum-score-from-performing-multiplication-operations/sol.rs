impl Solution {
    pub fn maximum_score(nums: Vec<i32>, multipliers: Vec<i32>) -> i32 {
        let m = multipliers.len();
        let mut dp = vec![vec![None; m + 1]; m + 1];
        
        fn f(i: usize, j: usize, nums: &Vec<i32>, multipliers: &Vec<i32>, dp: &mut Vec<Vec<Option<i32>>>) -> i32 {
            let k = i + j;
            if k == multipliers.len() { return 0; }
            if let Some(val) = dp[i][j] { return val; }
            
            let back = multipliers[k] * nums[nums.len() - 1 - j] + f(i, j + 1, nums, multipliers, dp);
            let front = multipliers[k] * nums[i] + f(i + 1, j, nums, multipliers, dp);
            let result = front.max(back);
            dp[i][j] = Some(result);
            result
        }
        
        f(0, 0, &nums, &multipliers, &mut dp)
    }
}
