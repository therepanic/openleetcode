impl Solution {
    pub fn partition(s: String) -> Vec<Vec<String>> {
        fn is_palindrome(chars: &[char], mut left: usize, mut right: usize) -> bool {
            while left < right { if chars[left] != chars[right] { return false; } left += 1; right -= 1; }
            true
        }
        fn backtrack(chars: &[char], index: usize, path: &mut Vec<String>, result: &mut Vec<Vec<String>>) {
            if index == chars.len() { result.push(path.clone()); return; }
            for end in index..chars.len() {
                if is_palindrome(chars, index, end) {
                    path.push(chars[index..=end].iter().collect());
                    backtrack(chars, end + 1, path, result);
                    path.pop();
                }
            }
        }
        let chars: Vec<char> = s.chars().collect();
        let mut result = Vec::new();
        let mut path = Vec::new();
        backtrack(&chars, 0, &mut path, &mut result);
        result
    }
}
