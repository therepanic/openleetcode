impl Solution {
    pub fn remove_duplicate_letters(s: String) -> String {
        use std::collections::{HashMap, HashSet};
        
        let mut last_occur: HashMap<char, usize> = HashMap::new();
        for (i, ch) in s.chars().enumerate() {
            last_occur.insert(ch, i);
        }
        
        let mut stack: Vec<char> = Vec::new();
        let mut visited: HashSet<char> = HashSet::new();
        
        for (i, ch) in s.chars().enumerate() {
            if visited.contains(&ch) {
                continue;
            }
            
            while let Some(&top) = stack.last() {
                if ch < top && i < *last_occur.get(&top).unwrap_or(&0) {
                    visited.remove(&stack.pop().unwrap());
                } else {
                    break;
                }
            }
            
            visited.insert(ch);
            stack.push(ch);
        }
        
        stack.into_iter().collect()
    }
}
