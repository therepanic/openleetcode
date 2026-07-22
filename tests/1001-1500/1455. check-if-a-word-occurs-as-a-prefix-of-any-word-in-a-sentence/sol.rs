impl Solution {
    pub fn is_prefix_of_word(sentence: String, search_word: String) -> i32 {
        let words: Vec<&str> = sentence.split_whitespace().collect();
        for i in 0..words.len() {
            if words[i].starts_with(&search_word) {
                return (i + 1) as i32;
            }
        }
        -1
    }
}
