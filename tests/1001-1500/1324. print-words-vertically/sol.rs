impl Solution {
    pub fn print_vertically(s: String) -> Vec<String> {
        let words: Vec<&str> = s.split_whitespace().collect();
        let max_len = words.iter().map(|w| w.len()).max().unwrap_or(0);
        let mut res = Vec::new();
        for i in 0..max_len {
            let mut curr_word = String::new();
            for word in &words {
                if i < word.len() {
                    curr_word.push(word.as_bytes()[i] as char);
                } else {
                    curr_word.push(' ');
                }
            }
            let trimmed = curr_word.trim_end().to_string();
            res.push(trimmed);
        }
        res
    }
}
