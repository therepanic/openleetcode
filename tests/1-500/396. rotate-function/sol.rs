impl Solution {
    pub fn max_rotate_function(nums: Vec<i32>) -> i32 {
        let n = nums.len() as i32;
        let mut total_sum = 0;
        let mut f = 0;
        for i in 0..nums.len() {
            total_sum += nums[i];
            f += i as i32 * nums[i];
        }
        let mut result = f;
        for k in 1..nums.len() {
            f = f + total_sum - n * nums[nums.len() - k];
            result = result.max(f);
        }
        result
    }
}
