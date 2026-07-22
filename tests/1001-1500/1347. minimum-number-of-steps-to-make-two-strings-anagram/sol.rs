impl Solution {
    pub fn min_steps(s: String, t: String) -> i32 {
        use std::collections::HashMap;
        let mut dic = HashMap::new();
        for ch in t.chars() {
            *dic.entry(ch).or_insert(0) += 1;
        }
        for ch in s.chars() {
            if let Some(count) = dic.get_mut(&ch) {
                if *count > 0 {
                    *count -= 1;
                }
            }
        }
        dic.values().sum()
    }
}
