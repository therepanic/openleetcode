impl Solution {
    pub fn word_pattern(pattern: String, s: String) -> bool {
        let words: Vec<&str> = s.split_whitespace().collect();
        if pattern.len() != words.len() {
            return false;
        }
        
        use std::collections::HashSet;
        let pattern_chars: Vec<char> = pattern.chars().collect();
        
        let pattern_set: HashSet<char> = pattern_chars.iter().cloned().collect();
        let word_set: HashSet<&str> = words.iter().cloned().collect();
        let pair_set: HashSet<String> = pattern_chars.iter()
            .zip(words.iter())
            .map(|(c, w)| format!("{},{}", c, w))
            .collect();
        
        pattern_set.len() == word_set.len() && word_set.len() == pair_set.len()
    }
}
