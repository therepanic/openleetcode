impl Solution {
    pub fn frequency_sort(s: String) -> String {
        use std::collections::HashMap;
        let mut freq = HashMap::new();
        for c in s.chars() {
            *freq.entry(c).or_insert(0) += 1;
        }
        let mut vec: Vec<(char, i32)> = freq.into_iter().collect();
        vec.sort_by(|a, b| b.1.cmp(&a.1));
        let mut result = String::new();
        for (c, count) in vec {
            for _ in 0..count {
                result.push(c);
            }
        }
        result
    }
}
