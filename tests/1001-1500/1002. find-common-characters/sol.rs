impl Solution {
    pub fn common_chars(words: Vec<String>) -> Vec<String> {
        let mut freq: std::collections::HashMap<char, usize> = std::collections::HashMap::new();
        for c in words[0].chars() {
            *freq.entry(c).or_insert(0) += 1;
        }
        for i in 1..words.len() {
            let mut f: std::collections::HashMap<char, usize> = std::collections::HashMap::new();
            for c in words[i].chars() {
                *f.entry(c).or_insert(0) += 1;
            }
            for c in freq.clone().keys() {
                if let Some(count) = f.get(c) {
                    freq.insert(*c, (*count).min(freq[c]));
                } else {
                    freq.insert(*c, 0);
                }
            }
        }
        let mut res: Vec<String> = Vec::new();
        for (c, count) in freq {
            for _ in 0..count {
                res.push(c.to_string());
            }
        }
        res
    }
}
