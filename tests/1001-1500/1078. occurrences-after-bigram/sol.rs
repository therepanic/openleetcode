impl Solution {
    pub fn find_ocurrences(text: String, first: String, second: String) -> Vec<String> {
        let words: Vec<&str> = text.split_whitespace().collect();
        let mut result = Vec::new();
        for i in 0..words.len().saturating_sub(2) {
            if words[i] == first && words[i + 1] == second {
                result.push(words[i + 2].to_string());
            }
        }
        result
    }
}
