use std::collections::{HashMap, HashSet};

impl Solution {
    pub fn word_break(s: String, word_dict: Vec<String>) -> Vec<String> {
        fn solve<'a>(s: &'a str, words: &HashSet<String>, memo: &mut HashMap<String, Vec<String>>) -> Vec<String> {
            if let Some(found) = memo.get(s) { return found.clone(); }
            let mut result = Vec::new();
            if words.contains(s) { result.push(s.to_string()); }
            for i in 1..s.len() {
                let prefix = &s[..i];
                if !words.contains(prefix) { continue; }
                let suffix_ways = solve(&s[i..], words, memo);
                for tail in suffix_ways { result.push(format!("{} {}", prefix, tail)); }
            }
            memo.insert(s.to_string(), result.clone());
            result
        }
        let words: HashSet<String> = word_dict.into_iter().collect();
        let mut memo = HashMap::new();
        solve(&s, &words, &mut memo)
    }
}
