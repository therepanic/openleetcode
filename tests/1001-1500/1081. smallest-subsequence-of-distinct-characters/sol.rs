impl Solution {
    pub fn smallest_subsequence(s: String) -> String {
        use std::collections::{HashMap, HashSet};
        let mut fq_map: HashMap<char, i32> = HashMap::new();
        let mut stack: Vec<char> = Vec::new();
        let mut visited: HashSet<char> = HashSet::new();
        for ch in s.chars() {
            *fq_map.entry(ch).or_insert(0) += 1;
        }
        for ch in s.chars() {
            *fq_map.get_mut(&ch).unwrap() -= 1;
            if visited.contains(&ch) {
                continue;
            }
            while let Some(&top) = stack.last() {
                if ch < top && *fq_map.get(&top).unwrap() > 0 {
                    visited.remove(&stack.pop().unwrap());
                } else {
                    break;
                }
            }
            visited.insert(ch);
            stack.push(ch);
        }
        stack.iter().collect()
    }
}
