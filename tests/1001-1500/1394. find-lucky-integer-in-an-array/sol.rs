impl Solution {
    pub fn find_lucky(arr: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        
        let mut freq: HashMap<i32, i32> = HashMap::new();
        for num in arr {
            *freq.entry(num).or_insert(0) += 1;
        }
        
        let mut lucky = -1;
        for (&num, &count) in freq.iter() {
            if num == count {
                lucky = lucky.max(num);
            }
        }
        
        lucky
    }
}
