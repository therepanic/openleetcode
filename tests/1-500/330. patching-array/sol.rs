impl Solution {
    pub fn min_patches(nums: Vec<i32>, n: i32) -> i32 {
        let mut current_sum: i64 = 1;
        let mut patches = 0;
        let mut index = 0;
        let n = n as i64;
        
        while current_sum <= n {
            if index < nums.len() && (nums[index] as i64) <= current_sum {
                current_sum += nums[index] as i64;
                index += 1;
            } else {
                current_sum += current_sum;
                patches += 1;
            }
        }
        
        patches
    }
}
