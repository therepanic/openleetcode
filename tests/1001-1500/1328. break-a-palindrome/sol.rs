impl Solution {
    pub fn break_palindrome(palindrome: String) -> String {
        if palindrome.len() == 1 {
            return "".to_string();
        }
        let mut chars: Vec<char> = palindrome.chars().collect();
        let n = chars.len();
        for i in 0..n / 2 {
            if chars[i] != 'a' {
                chars[i] = 'a';
                return chars.into_iter().collect();
            }
        }
        chars[n - 1] = 'b';
        chars.into_iter().collect()
    }
}
