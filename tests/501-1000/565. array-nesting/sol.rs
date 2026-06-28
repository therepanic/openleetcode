impl Solution {
    pub fn array_nesting(nums: Vec<i32>) -> i32 {
        let mut nums = nums;
        let mut max_count = 0;
        
        for i in 0..nums.len() {
            if nums[i] == -1 {
                continue;
            }
            
            let mut current_count = 0;
            let mut start = i;
            
            while nums[start] != -1 {
                let next_node = nums[start] as usize;
                nums[start] = -1;
                start = next_node;
                current_count += 1;
            }
            
            if current_count > max_count {
                max_count = current_count;
            }
        }
        
        max_count
    }
}
