impl Solution {
    pub fn longest_str_chain(words: Vec<String>) -> i32 {
        use std::collections::HashMap;
        
        let mut words = words;
        words.sort_by_key(|w| w.len());
        
        let mut chains: HashMap<String, i32> = HashMap::new();
        
        for word in &words {
            chains.insert(word.clone(), 1);
            for i in 0..word.len() {
                let pred = format!("{}{}", &word[..i], &word[i+1..]);
                if let Some(&prev_chain) = chains.get(&pred) {
                    let current = chains.get_mut(word).unwrap();
                    *current = (*current).max(prev_chain + 1);
                }
            }
        }
        
        chains.values().max().copied().unwrap_or(0)
    }
}
