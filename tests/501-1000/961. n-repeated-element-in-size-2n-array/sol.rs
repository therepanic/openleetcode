impl Solution {
    pub fn repeated_n_times(nums: Vec<i32>) -> i32 {
        let n = nums.len() - 2;
        for i in 0..n {
            if nums[i] == nums[i + 1] || nums[i] == nums[i + 2] {
                return nums[i];
            }
        }
        nums[n + 1]
    }
}
