use std::collections::HashMap;

impl Solution {
    pub fn group_anagrams(strs: Vec<String>) -> Vec<Vec<String>> {
        let mut groups: HashMap<String, Vec<String>> = HashMap::new();
        let mut keys = Vec::new();

        for word in strs {
            let mut chars: Vec<char> = word.chars().collect();
            chars.sort_unstable();
            let key: String = chars.into_iter().collect();
            if !groups.contains_key(&key) {
                keys.push(key.clone());
            }
            groups.entry(key).or_insert_with(Vec::new).push(word);
        }

        let mut res = Vec::new();
        for key in keys {
            res.push(groups.remove(&key).unwrap());
        }
        res
    }
}
