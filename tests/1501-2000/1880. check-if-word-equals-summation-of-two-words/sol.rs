impl Solution {
    pub fn is_sum_equal(first_word: String, second_word: String, target_word: String) -> bool {
        fn convert(word: &str) -> i32 {
            let s: String = word.chars().map(|c| (c as u8 - b'a').to_string()).collect();
            s.parse().unwrap()
        }
        convert(&first_word) + convert(&second_word) == convert(&target_word)
    }
}
