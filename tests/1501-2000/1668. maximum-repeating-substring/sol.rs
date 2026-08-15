impl Solution {
    pub fn max_repeating(sequence: String, word: String) -> i32 {
        let mut temp = word.clone();
        let mut res = 0;
        while sequence.contains(&temp) {
            res += 1;
            temp.push_str(&word);
        }
        res
    }
}
