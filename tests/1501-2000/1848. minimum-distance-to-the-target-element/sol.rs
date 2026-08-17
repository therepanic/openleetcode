impl Solution {
    pub fn get_min_distance(nums: Vec<i32>, target: i32, start: i32) -> i32 {
        if nums[start as usize] == target {
            return 0;
        }
        
        let n = nums.len() as i32;
        let mut d = 1;
        
        loop {
            if start - d >= 0 && nums[(start - d) as usize] == target {
                return d;
            }
            
            if start + d < n && nums[(start + d) as usize] == target {
                return d;
            }
            
            d += 1;
        }
    }
}
