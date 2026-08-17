impl Solution {
    pub fn min_operations(nums: Vec<i32>) -> i32 {
        let length = nums.len() as i32;
        let mut min_ops = length;
        let mut unique_nums: Vec<i32> = nums.iter().cloned().collect::<std::collections::HashSet<_>>().into_iter().collect();
        unique_nums.sort();
        let mut right = 0;
        
        for left in 0..unique_nums.len() {
            while right < unique_nums.len() && unique_nums[right] < unique_nums[left] + length {
                right += 1;
            }
            
            min_ops = min_ops.min(length - (right as i32 - left as i32));
        }
        
        min_ops
    }
}
