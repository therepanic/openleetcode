impl Solution {
    pub fn nearest_palindromic(n: String) -> String {
        let num: i128 = n.parse().unwrap();

        fn pow10(exp: usize) -> i128 {
            let mut value = 1_i128;
            for _ in 0..exp {
                value *= 10;
            }
            value
        }

        fn make_pal(prefix: i128, total_len: usize) -> i128 {
            let left = prefix.to_string();
            let right_source = if total_len % 2 == 0 {
                left.clone()
            } else {
                left[..left.len() - 1].to_string()
            };
            let right: String = right_source.chars().rev().collect();
            format!("{}{}", left, right).parse().unwrap()
        }

        let mut candidates = std::collections::HashSet::new();
        candidates.insert(pow10(n.len() - 1) - 1);
        candidates.insert(pow10(n.len()) + 1);

        let prefix_len = (n.len() + 1) / 2;
        let prefix: i128 = n[..prefix_len].parse().unwrap();
        for delta in -1_i128..=1 {
            if prefix + delta >= 0 {
                candidates.insert(make_pal(prefix + delta, n.len()));
            }
        }

        let mut best: Option<i128> = None;
        for cand in candidates {
            if cand == num {
                continue;
            }
            if let Some(current) = best {
                let cand_diff = (cand - num).abs();
                let current_diff = (current - num).abs();
                if cand_diff < current_diff || (cand_diff == current_diff && cand < current) {
                    best = Some(cand);
                }
            } else {
                best = Some(cand);
            }
        }

        best.unwrap().to_string()
    }
}
