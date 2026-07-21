impl Solution {
    pub fn max_freq(s: String, max_letters: i32, min_size: i32, max_size: i32) -> i32 {
        use std::collections::HashMap;
        let mut count: HashMap<String, i32> = HashMap::new();
        let mut unique: HashMap<char, i32> = HashMap::new();
        let mut left = 0;
        let mut res = 0;
        let chars: Vec<char> = s.chars().collect();
        let min_size = min_size as usize;
        let max_letters = max_letters as usize;
        for right in 0..chars.len() {
            *unique.entry(chars[right]).or_insert(0) += 1;

            while unique.len() > max_letters || right - left + 1 > min_size {
                let lc = chars[left];
                if let Some(cnt) = unique.get_mut(&lc) {
                    *cnt -= 1;
                    if *cnt == 0 {
                        unique.remove(&lc);
                    }
                }
                left += 1;
            }

            if right - left + 1 == min_size && unique.len() <= max_letters {
                let curr: String = chars[left..=right].iter().collect();
                let val = count.entry(curr).or_insert(0);
                *val += 1;
                res = res.max(*val);
            }
        }
        res
    }
}
