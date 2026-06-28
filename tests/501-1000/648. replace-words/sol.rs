use std::collections::HashSet;

impl Solution {
    pub fn replace_words(dictionary: Vec<String>, sentence: String) -> String {
        let roots: HashSet<String> = dictionary.into_iter().collect();
        let mut parts: Vec<String> = sentence.split_whitespace().map(|s| s.to_string()).collect();

        for word in &mut parts {
            let mut replacement = word.clone();
            for len in 1..=word.len() {
                let prefix = &word[..len];
                if roots.contains(prefix) {
                    replacement = prefix.to_string();
                    break;
                }
            }
            *word = replacement;
        }

        parts.join(" ")
    }
}
