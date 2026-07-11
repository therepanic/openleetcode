impl Solution {
    pub fn is_monotonic(nums: Vec<i32>) -> bool {
        let n = nums.len();
        if nums[0] < nums[n - 1] {
            for i in 1..n {
                if nums[i] < nums[i - 1] {
                    return false;
                }
            }
        } else {
            for i in 1..n {
                if nums[i] > nums[i - 1] {
                    return false;
                }
            }
        }
        true
    }
}
