impl Solution {
    pub fn reverse_prefix(word: String, ch: char) -> String {
        let idx = word.find(ch);
        match idx {
            Some(i) => {
                let mut chars: Vec<char> = word.chars().collect();
                let mut left = 0;
                let mut right = i;
                while left < right {
                    chars.swap(left, right);
                    left += 1;
                    right -= 1;
                }
                chars.into_iter().collect()
            }
            None => word,
        }
    }
}
