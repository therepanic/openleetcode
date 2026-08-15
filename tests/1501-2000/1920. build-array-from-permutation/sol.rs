impl Solution {
    pub fn build_array(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        for i in 0..nums.len() {
            nums[i] += (1024 * (nums[nums[i] as usize] % 1024));
        }
        
        for i in 0..nums.len() {
            nums[i] /= 1024;
        }
        
        nums
    }
}
