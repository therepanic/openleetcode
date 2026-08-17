impl Solution {
    pub fn maximum_difference(nums: Vec<i32>) -> i32 {
        let mut min_val = nums[0];
        let mut max_diff = -1;
        for i in 1..nums.len() {
            if nums[i] > min_val {
                max_diff = max_diff.max(nums[i] - min_val);
            } else {
                min_val = nums[i];
            }
        }
        max_diff
    }
}
