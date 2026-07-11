impl Solution {
    pub fn most_common_word(paragraph: String, banned: Vec<String>) -> String {
        use std::collections::{HashMap, HashSet};
        let banned_set: HashSet<String> = banned.into_iter().collect();
        let mut counts = HashMap::new();
        let re = regex::Regex::new(r"[a-z]+").unwrap();
        for w in re.find_iter(&paragraph.to_lowercase()) {
            let w = w.as_str().to_string();
            if !banned_set.contains(&w) {
                *counts.entry(w).or_insert(0) += 1;
            }
        }
        counts.into_iter().max_by_key(|&(_, v)| v).unwrap().0
    }
}
