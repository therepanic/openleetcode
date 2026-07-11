impl Solution {
    pub fn minimum_length_encoding(words: Vec<String>) -> i32 {
        use std::collections::HashSet;

        let uniq: Vec<String> = words.into_iter().collect::<HashSet<_>>().into_iter().collect();
        let mut ans = 0;
        'outer: for word in &uniq {
            for other in &uniq {
                if word != other && other.ends_with(word) {
                    continue 'outer;
                }
            }
            ans += word.len() as i32 + 1;
        }
        ans
    }
}
