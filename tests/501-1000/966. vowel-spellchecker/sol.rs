impl Solution {
    pub fn spellchecker(wordlist: Vec<String>, queries: Vec<String>) -> Vec<String> {
        use std::collections::{HashMap, HashSet};
        
        let exact: HashSet<String> = wordlist.iter().cloned().collect();
        let mut case_map = HashMap::new();
        let mut vowel_map = HashMap::new();
        
        for w in &wordlist {
            let lower = w.to_lowercase();
            let devowel = Self::de_vowel(&lower);
            case_map.entry(lower.clone()).or_insert(w.clone());
            vowel_map.entry(devowel).or_insert(w.clone());
        }
        
        queries.iter().map(|q| {
            if exact.contains(q) {
                q.clone()
            } else {
                let lower = q.to_lowercase();
                let devowel = Self::de_vowel(&lower);
                if let Some(matched) = case_map.get(&lower) {
                    matched.clone()
                } else if let Some(matched) = vowel_map.get(&devowel) {
                    matched.clone()
                } else {
                    String::new()
                }
            }
        }).collect()
    }
    
    fn de_vowel(s: &str) -> String {
        s.chars().map(|c| if "aeiou".contains(c) { '*' } else { c }).collect()
    }
}
