use std::collections::{HashSet, VecDeque};

impl Solution {
    pub fn ladder_length(begin_word: String, end_word: String, word_list: Vec<String>) -> i32 {
        let mut words: HashSet<String> = word_list.into_iter().collect();
        if !words.contains(&end_word) {
            return 0;
        }

        let word_len = begin_word.len();
        let mut queue = VecDeque::new();
        queue.push_back((begin_word, 1));

        while let Some((word, steps)) = queue.pop_front() {
            if word == end_word {
                return steps;
            }

            let mut chars: Vec<u8> = word.as_bytes().to_vec();
            for i in 0..word_len {
                let original = chars[i];
                for c in b'a'..=b'z' {
                    if c == original {
                        continue;
                    }
                    chars[i] = c;
                    let next = String::from_utf8(chars.clone()).unwrap();
                    if words.remove(&next) {
                        queue.push_back((next, steps + 1));
                    }
                }
                chars[i] = original;
            }
        }

        0
    }
}
