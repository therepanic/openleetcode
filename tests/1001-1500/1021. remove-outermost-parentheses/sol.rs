impl Solution {
    pub fn remove_outer_parentheses(s: String) -> String {
        let mut res = String::new();
        let mut balance = 0;
        let mut start = 0;
        for (i, ch) in s.char_indices() {
            if ch == '(' {
                balance += 1;
            } else {
                balance -= 1;
            }
            if balance == 0 {
                res.push_str(&s[start + 1..i]);
                start = i + 1;
            }
        }
        res
    }
}
