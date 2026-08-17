impl Solution {
    pub fn replace_digits(s: String) -> String {
        let mut chars: Vec<char> = s.chars().collect();
        for i in (1..chars.len()).step_by(2) {
            let ch = chars[i - 1];
            let digit = chars[i].to_digit(10).unwrap();
            let new_char = (ch as u8 + digit as u8) as char;
            chars[i] = new_char;
        }
        chars.into_iter().collect()
    }
}
