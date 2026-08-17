impl Solution {
    pub fn sort_sentence(s: String) -> String {
        let mut words: std::collections::HashMap<usize, String> = std::collections::HashMap::new();
        for word in s.split_whitespace() {
            let key: usize = word.chars().last().unwrap().to_digit(10).unwrap() as usize;
            words.insert(key, word[..word.len()-1].to_string());
        }
        let mut sorted_keys: Vec<usize> = words.keys().cloned().collect();
        sorted_keys.sort();
        sorted_keys.iter().map(|k| words[k].clone()).collect::<Vec<String>>().join(" ")
    }
}
