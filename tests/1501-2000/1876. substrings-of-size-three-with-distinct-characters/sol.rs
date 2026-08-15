impl Solution {
    pub fn count_good_substrings(s: String) -> i32 {
        let chars: Vec<char> = s.chars().collect();
        let mut count = 0;
        for i in 0..(chars.len().saturating_sub(2)) {
            if chars[i] != chars[i+1] && chars[i+1] != chars[i+2] && chars[i] != chars[i+2] {
                count += 1;
            }
        }
        count
    }
}
