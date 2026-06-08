use std::collections::HashMap;

impl Solution {
    pub fn find_substring(s: String, words: Vec<String>) -> Vec<i32> {
        let mut ans = Vec::new();
        if s.is_empty() || words.is_empty() {
            return ans;
        }

        let word_len = words[0].len();
        let word_count = words.len();
        let mut target: HashMap<String, i32> = HashMap::new();
        for word in &words {
            *target.entry(word.clone()).or_insert(0) += 1;
        }

        for offset in 0..word_len {
            let mut left = offset;
            let mut right = offset;
            let mut used = 0usize;
            let mut window: HashMap<String, i32> = HashMap::new();

            while right + word_len <= s.len() {
                let word = s[right..right + word_len].to_string();
                right += word_len;

                if target.contains_key(&word) {
                    *window.entry(word.clone()).or_insert(0) += 1;
                    used += 1;

                    while window.get(&word).copied().unwrap_or(0) > *target.get(&word).unwrap() {
                        let left_word = s[left..left + word_len].to_string();
                        if let Some(v) = window.get_mut(&left_word) {
                            *v -= 1;
                        }
                        left += word_len;
                        used -= 1;
                    }

                    if used == word_count {
                        ans.push(left as i32);
                        let left_word = s[left..left + word_len].to_string();
                        if let Some(v) = window.get_mut(&left_word) {
                            *v -= 1;
                        }
                        left += word_len;
                        used -= 1;
                    }
                } else {
                    window.clear();
                    used = 0;
                    left = right;
                }
            }
        }
        ans
    }
}
