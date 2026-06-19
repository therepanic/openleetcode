impl Solution {
    pub fn find_all_concatenated_words_in_a_dict(words: Vec<String>) -> Vec<String> {
        use std::collections::HashSet;
        
        fn dfs(word: &str, word_set: &HashSet<String>, incorrect: &mut HashSet<String>) -> bool {
            if word_set.contains(word) {
                return true;
            }
            if incorrect.contains(word) {
                return false;
            }
            
            for i in 1..word.len() {
                let prefix = &word[..i];
                if word_set.contains(prefix) {
                    let suffix = &word[i..];
                    if dfs(suffix, word_set, incorrect) {
                        return true;
                    } else {
                        incorrect.insert(suffix.to_string());
                    }
                }
            }
            
            incorrect.insert(word.to_string());
            false
        }
        
        let mut res = Vec::new();
        let mut word_set: HashSet<String> = words.iter().cloned().collect();
        let mut incorrect = HashSet::new();
        
        for word in &words {
            word_set.remove(word);
            if dfs(word, &word_set, &mut incorrect) {
                res.push(word.clone());
            }
            word_set.insert(word.clone());
        }
        
        res
    }
}
