impl Solution {
    pub fn find_lhs(nums: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        
        let mut frequency_map: HashMap<i32, i32> = HashMap::new();
        for &num in &nums {
            *frequency_map.entry(num).or_insert(0) += 1;
        }
        
        let mut max_length = 0;
        for (&num, &count) in &frequency_map {
            if let Some(&next_count) = frequency_map.get(&(num + 1)) {
                let current_length = count + next_count;
                max_length = max_length.max(current_length);
            }
        }
        
        max_length
    }
}
