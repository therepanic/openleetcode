impl Solution {
    pub fn min_window(s: String, t: String) -> String {
        if s.len() < t.len() || t.is_empty() {
            return String::new();
        }

        let s: Vec<char> = s.chars().collect();
        let mut need = std::collections::HashMap::<char, i32>::new();
        for ch in t.chars() {
            *need.entry(ch).or_insert(0) += 1;
        }

        let mut missing = t.len() as i32;
        let mut left = 0usize;
        let mut best_l = 0usize;
        let mut best_len = usize::MAX;

        for right in 0..s.len() {
            let c = s[right];
            if let Some(v) = need.get_mut(&c) {
                if *v > 0 {
                    missing -= 1;
                }
                *v -= 1;
            }

            while missing == 0 {
                if right - left + 1 < best_len {
                    best_len = right - left + 1;
                    best_l = left;
                }
                let d = s[left];
                left += 1;
                if let Some(v) = need.get_mut(&d) {
                    *v += 1;
                    if *v > 0 {
                        missing += 1;
                    }
                }
            }
        }

        if best_len == usize::MAX {
            String::new()
        } else {
            s[best_l..best_l + best_len].iter().collect()
        }
    }
}
