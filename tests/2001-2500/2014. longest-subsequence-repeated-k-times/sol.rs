impl Solution {
    pub fn longest_subsequence_repeated_k(s: String, k: i32) -> String {
        fn is_k(sub: &str, t: &str, k: usize) -> bool {
            let sub_chars: Vec<char> = sub.chars().collect();
            let mut count = 0;
            let mut i = 0;
            for ch in t.chars() {
                if i < sub_chars.len() && ch == sub_chars[i] {
                    i += 1;
                    if i == sub_chars.len() {
                        i = 0;
                        count += 1;
                        if count == k {
                            return true;
                        }
                    }
                }
            }
            false
        }

        let mut res = String::new();
        let mut q: std::collections::VecDeque<String> = std::collections::VecDeque::from([String::new()]);
        while let Some(curr) = q.pop_front() {
            for c in 97u8..=122u8 {
                let mut nxt = curr.clone();
                nxt.push(c as char);
                if is_k(&nxt, &s, k as usize) {
                    res = nxt.clone();
                    q.push_back(nxt);
                }
            }
        }
        res
    }
}
