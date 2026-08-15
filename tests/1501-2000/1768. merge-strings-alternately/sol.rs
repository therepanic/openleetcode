impl Solution {
    pub fn merge_alternately(word1: String, word2: String) -> String {
        let mut merged = String::new();
        let mut chars1 = word1.chars();
        let mut chars2 = word2.chars();
        loop {
            match (chars1.next(), chars2.next()) {
                (Some(c1), Some(c2)) => {
                    merged.push(c1);
                    merged.push(c2);
                }
                (Some(c1), None) => {
                    merged.push(c1);
                    merged.push_str(chars1.as_str());
                    break;
                }
                (None, Some(c2)) => {
                    merged.push(c2);
                    merged.push_str(chars2.as_str());
                    break;
                }
                (None, None) => break,
            }
        }
        merged
    }
}
