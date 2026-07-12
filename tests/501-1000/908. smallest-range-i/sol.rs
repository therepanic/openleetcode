impl Solution {
    pub fn smallest_range_i(nums: Vec<i32>, k: i32) -> i32 {
        let mut min_val = nums[0];
        let mut max_val = nums[0];
        
        for &val in &nums {
            if val < min_val {
                min_val = val;
            } else if val > max_val {
                max_val = val;
            }
        }
        
        let result = max_val - min_val - k * 2;
        if result < 0 {
            0
        } else {
            result
        }
    }
}
