impl Solution {
    pub fn find_max_consecutive_ones(nums: Vec<i32>) -> i32 {
        let mut res = 0;
        let mut left = 0;
        for right in 0..nums.len() {
            if nums[right] == 0 {
                left = right + 1;
            } else {
                res = res.max(right - left + 1);
            }
        }
        res as i32
    }
}
