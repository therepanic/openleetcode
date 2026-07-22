impl Solution {
    pub fn count_characters(words: Vec<String>, chars: String) -> i32 {
        use std::collections::HashMap;
        
        let mut ch: HashMap<char, i32> = HashMap::new();
        for c in chars.chars() {
            *ch.entry(c).or_insert(0) += 1;
        }
        
        let mut res = 0;
        for word in words {
            let mut copy = ch.clone();
            let mut good = true;
            for c in word.chars() {
                if let Some(count) = copy.get_mut(&c) {
                    if *count > 0 {
                        *count -= 1;
                    } else {
                        res -= word.len() as i32;
                        good = false;
                        break;
                    }
                } else {
                    res -= word.len() as i32;
                    good = false;
                    break;
                }
            }
            res += word.len() as i32;
        }
        res
    }
}
