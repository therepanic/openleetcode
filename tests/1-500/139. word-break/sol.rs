use std::collections::HashSet;

impl Solution {
    pub fn word_break(s: String, word_dict: Vec<String>) -> bool {
        let words: HashSet<String> = word_dict.iter().cloned().collect();
        let max_len = word_dict.iter().map(|w| w.len()).max().unwrap_or(0);
        let bytes = s.as_bytes();
        let n = bytes.len();
        let mut dp = vec![false; n + 1];
        dp[n] = true;
        for i in (0..n).rev() {
            for len in 1..=max_len {
                if i + len > n { break; }
                let candidate = std::str::from_utf8(&bytes[i..i + len]).unwrap();
                if words.contains(candidate) && dp[i + len] { dp[i] = true; break; }
            }
        }
        dp[0]
    }
}
