impl Solution {
    pub fn find_least_num_of_unique_ints(arr: Vec<i32>, k: i32) -> i32 {
        use std::collections::HashMap;
        let mut counts: HashMap<i32, i32> = HashMap::new();
        for num in arr {
            *counts.entry(num).or_insert(0) += 1;
        }
        let mut remaining = counts.len() as i32;
        let mut freqs: Vec<i32> = counts.values().cloned().collect();
        freqs.sort();
        let mut k = k;
        for count in freqs {
            if k < count {
                break;
            }
            k -= count;
            remaining -= 1;
        }
        remaining
    }
}
