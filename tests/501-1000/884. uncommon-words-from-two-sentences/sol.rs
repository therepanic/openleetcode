impl Solution {
    pub fn uncommon_from_sentences(s1: String, s2: String) -> Vec<String> {
        use std::collections::HashMap;
        let mut count = HashMap::new();
        for word in s1.split_whitespace().chain(s2.split_whitespace()) {
            *count.entry(word.to_string()).or_insert(0) += 1;
        }
        count.into_iter().filter(|&(_, c)| c == 1).map(|(w, _)| w).collect()
    }
}
