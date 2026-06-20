impl Solution {
    pub fn contains_nearby_duplicate(nums: Vec<i32>, k: i32) -> bool {
        use std::collections::HashSet;
        let mut window_set = HashSet::new();
        let k = k as usize;
        
        for i in 0..nums.len() {
            if i > k {
                window_set.remove(&nums[i - k - 1]);
            }
            
            if window_set.contains(&nums[i]) {
                return true;
            }
            
            window_set.insert(nums[i]);
        }
        
        false
    }
}
