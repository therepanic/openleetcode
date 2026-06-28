impl Solution {
    pub fn reverse_words(s: String) -> String {
        let words: Vec<&str> = s.split_whitespace().collect();
        let reversed_words: Vec<String> = words.iter().map(|word| word.chars().rev().collect()).collect();
        reversed_words.join(" ")
    }
}
