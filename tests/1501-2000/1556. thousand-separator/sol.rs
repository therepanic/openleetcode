impl Solution {
    pub fn thousand_separator(n: i32) -> String {
        let s = n.to_string();
        if s.len() <= 3 {
            return s;
        }
        let mut result = String::new();
        let mut count = 0;
        for ch in s.chars().rev() {
            result.push(ch);
            count += 1;
            if count % 3 == 0 && count < s.len() {
                result.push('.');
            }
        }
        result.chars().rev().collect()
    }
}
