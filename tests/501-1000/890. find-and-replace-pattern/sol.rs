impl Solution {
    pub fn find_and_replace_pattern(words: Vec<String>, pattern: String) -> Vec<String> {
        let counts: Vec<usize> = pattern.chars().map(|c| pattern.find(c).unwrap()).collect();
        let mut res: Vec<String> = Vec::new();
        for word in words {
            let count: Vec<usize> = word.chars().map(|c| word.find(c).unwrap()).collect();
            if count == counts {
                res.push(word);
            }
        }
        res
    }
}
