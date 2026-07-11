impl Solution {
    pub fn can_reorder_doubled(arr: Vec<i32>) -> bool {
        use std::collections::HashMap;
        
        let mut freq: HashMap<i32, i32> = HashMap::new();
        for &i in &arr {
            *freq.entry(i).or_insert(0) += 1;
        }
        
        let mut arr = arr;
        arr.sort_by_key(|&x| x.abs());
        
        for &val in &arr {
            if freq[&val] == 0 {
                continue;
            }
            let target = val * 2;
            if let Some(&count) = freq.get(&target) {
                if count > 0 {
                    *freq.get_mut(&val).unwrap() -= 1;
                    *freq.get_mut(&target).unwrap() -= 1;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
        true
    }
}
