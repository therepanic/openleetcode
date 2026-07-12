use std::collections::{VecDeque, HashSet};

impl Solution {
    pub fn k_similarity(s1: String, s2: String) -> i32 {
        let mut queue = VecDeque::from(vec![s1.clone()]);
        let mut seen = HashSet::new();
        let mut answ = 0;
        let s1_bytes = s1.as_bytes();
        let s2_bytes = s2.as_bytes();
        
        while !queue.is_empty() {
            let size = queue.len();
            for _ in 0..size {
                let string = queue.pop_front().unwrap();
                if string == s2 {
                    return answ;
                }
                
                let mut bytes = string.into_bytes();
                let mut i = 0;
                while bytes[i] == s2_bytes[i] {
                    i += 1;
                }
                
                for j in i + 1..bytes.len() {
                    if bytes[i] == s2_bytes[j] && s2_bytes[j] != s1_bytes[j] {
                        bytes.swap(i, j);
                        let new_str = String::from_utf8(bytes.clone()).unwrap();
                        if !seen.contains(&new_str) {
                            seen.insert(new_str.clone());
                            queue.push_back(new_str);
                        }
                        bytes.swap(i, j);
                    }
                }
            }
            answ += 1;
        }
        answ
    }
}
