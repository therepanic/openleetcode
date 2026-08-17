impl Solution {
    pub fn max_ascending_sum(nums: Vec<i32>) -> i32 {
        let mut curr = nums[0];
        let mut ans = nums[0];
        for i in 1..nums.len() {
            curr = if nums[i] > nums[i-1] { curr + nums[i] } else { nums[i] };
            ans = ans.max(curr);
        }
        ans
    }
}
