impl Solution {
    pub fn find_original_array(changed: Vec<i32>) -> Vec<i32> {
        if changed.len() % 2 != 0 {
            return vec![];
        }
        
        use std::collections::HashMap;
        let mut count = HashMap::new();
        for &num in &changed {
            *count.entry(num).or_insert(0) += 1;
        }
        let mut sorted = changed.clone();
        sorted.sort();
        let mut original = Vec::new();
        
        for &num in &sorted {
            if count[&num] == 0 { continue; }
            let double = 2 * num;
            if !count.contains_key(&double) || count[&double] == 0 {
                return vec![];
            }
            original.push(num);
            *count.get_mut(&num).unwrap() -= 1;
            *count.get_mut(&double).unwrap() -= 1;
        }
        
        original
    }
}
