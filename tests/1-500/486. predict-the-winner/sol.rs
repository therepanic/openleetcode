impl Solution {
    pub fn predict_the_winner(nums: Vec<i32>) -> bool {
        fn helper(nums: &[i32], left: usize, right: usize) -> i32 {
            if left == right {
                return nums[left];
            }
            std::cmp::max(
                nums[left] - helper(nums, left + 1, right),
                nums[right] - helper(nums, left, right - 1),
            )
        }
        helper(&nums, 0, nums.len() - 1) >= 0
    }
}
