impl Solution {
    pub fn reformat(s: String) -> String {
        let digits: Vec<char> = s.chars().filter(|c| c.is_digit(10)).collect();
        let letters: Vec<char> = s.chars().filter(|c| c.is_alphabetic()).collect();
        if (digits.len() as i32 - letters.len() as i32).abs() >= 2 {
            return String::new();
        }
        let mut ans = vec![' '; s.len()];
        if digits.len() > letters.len() {
            for i in 0..s.len() {
                ans[i] = if i % 2 == 0 { digits[i / 2] } else { letters[i / 2] };
            }
        } else {
            for i in 0..s.len() {
                ans[i] = if i % 2 == 0 { letters[i / 2] } else { digits[i / 2] };
            }
        }
        ans.into_iter().collect()
    }
}
