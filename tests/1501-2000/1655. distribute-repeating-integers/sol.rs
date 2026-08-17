impl Solution {
    pub fn can_distribute(nums: Vec<i32>, quantity: Vec<i32>) -> bool {
        let mut quantity = quantity;
        quantity.sort_by(|a, b| b.cmp(a));
        
        use std::collections::HashMap;
        let mut freq_counts: HashMap<i32, i32> = HashMap::new();
        let mut freq_map: HashMap<i32, i32> = HashMap::new();
        for n in nums {
            *freq_map.entry(n).or_insert(0) += 1;
        }
        for f in freq_map.values() {
            *freq_counts.entry(*f).or_insert(0) += 1;
        }
        
        fn backtrack(i: usize, quantity: &Vec<i32>, freq_counts: &mut HashMap<i32, i32>) -> bool {
            if i == quantity.len() {
                return true;
            }
            let keys: Vec<i32> = freq_counts.keys().cloned().collect();
            for freq in keys {
                let count = *freq_counts.get(&freq).unwrap();
                if freq >= quantity[i] && count > 0 {
                    *freq_counts.get_mut(&freq).unwrap() -= 1;
                    let new_freq = freq - quantity[i];
                    *freq_counts.entry(new_freq).or_insert(0) += 1;
                    if backtrack(i + 1, quantity, freq_counts) {
                        return true;
                    }
                    *freq_counts.get_mut(&freq).unwrap() += 1;
                    let new_count = *freq_counts.get(&new_freq).unwrap();
                    if new_count == 1 {
                        freq_counts.remove(&new_freq);
                    } else {
                        *freq_counts.get_mut(&new_freq).unwrap() -= 1;
                    }
                }
            }
            false
        }
        
        backtrack(0, &quantity, &mut freq_counts)
    }
}
