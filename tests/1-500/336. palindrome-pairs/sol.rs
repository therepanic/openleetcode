impl Solution {
    fn is_palindrome(s: &str) -> bool {
        s.chars().eq(s.chars().rev())
    }

    pub fn palindrome_pairs(words: Vec<String>) -> Vec<Vec<i32>> {
        use std::collections::HashMap;
        let mut ans = Vec::new();
        let mut word_map = HashMap::new();
        for (i, word) in words.iter().enumerate() {
            word_map.insert(word.chars().rev().collect::<String>(), i as i32);
        }

        if let Some(&empty_idx) = word_map.get("") {
            for (i, word) in words.iter().enumerate() {
                if word != "" && Self::is_palindrome(word) {
                    ans.push(vec![i as i32, empty_idx]);
                }
            }
        }

        for (i, word) in words.iter().enumerate() {
            for j in 0..word.len() {
                let left = &word[..=j];
                let right = &word[j+1..];
                if let Some(&idx) = word_map.get(left) {
                    if Self::is_palindrome(right) && idx != i as i32 {
                        ans.push(vec![i as i32, idx]);
                    }
                }
                if let Some(&idx) = word_map.get(right) {
                    if Self::is_palindrome(left) && idx != i as i32 {
                        ans.push(vec![idx, i as i32]);
                    }
                }
            }
        }
        ans
    }
}
