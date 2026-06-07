use std::collections::HashMap;

impl Solution {
    pub fn length_of_longest_substring(s: String) -> i32 {
        let chars: Vec<char> = s.chars().collect();
        let mut last_seen: HashMap<char, i32> = HashMap::new();
        let mut start: i32 = 0;
        let mut res: i32 = 0;
        for (end, &c) in chars.iter().enumerate() {
            let end = end as i32;
            if let Some(&prev) = last_seen.get(&c) {
                if prev >= start {
                    start = prev + 1;
                }
            }
            res = res.max(end - start + 1);
            last_seen.insert(c, end);
        }
        res
    }
}
