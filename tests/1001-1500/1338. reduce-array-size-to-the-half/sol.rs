impl Solution {
    pub fn min_set_size(arr: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        let mut freq: HashMap<i32, i32> = HashMap::new();
        for num in &arr {
            *freq.entry(*num).or_insert(0) += 1;
        }
        
        let mut counts: Vec<i32> = freq.values().cloned().collect();
        counts.sort_by(|a, b| b.cmp(a));
        
        let mut sum_removed = 0;
        let mut min_set_size = 0;
        for count in counts {
            sum_removed += count;
            min_set_size += 1;
            if sum_removed >= (arr.len() / 2) as i32 {
                return min_set_size;
            }
        }
        min_set_size
    }
}
