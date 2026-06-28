impl Solution {
    pub fn detect_capital_use(word: String) -> bool {
        word == word.to_uppercase() || 
        word == word.to_lowercase() || 
        word == format!("{}{}", &word[0..1].to_uppercase(), &word[1..].to_lowercase())
    }
}
