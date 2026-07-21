impl Solution {
    pub fn balanced_string(s: String) -> i32 {
        let n = s.len();
        let each = n / 4;
        let mut count = std::collections::HashMap::new();
        for c in s.chars() {
            *count.entry(c).or_insert(0) += 1;
        }
        let mut extra = std::collections::HashMap::new();
        for (&k, &v) in &count {
            if v > each {
                extra.insert(k, v - each);
            }
        }
        if extra.is_empty() {
            return 0;
        }
        let s_chars: Vec<char> = s.chars().collect();
        let mut left = 0;
        let mut res = i32::MAX as usize;
        let mut curr = std::collections::HashMap::new();
        for right in 0..n {
            let rc = s_chars[right];
            if extra.contains_key(&rc) {
                *curr.entry(rc).or_insert(0) += 1;
            }
            while extra.iter().all(|(k, v)| curr.get(k).unwrap_or(&0) >= v) && left <= right {
                res = res.min(right - left + 1);
                let lc = s_chars[left];
                if let Some(val) = curr.get_mut(&lc) {
                    *val -= 1;
                    if *val == 0 {
                        curr.remove(&lc);
                    }
                }
                left += 1;
            }
        }
        res as i32
    }
}
