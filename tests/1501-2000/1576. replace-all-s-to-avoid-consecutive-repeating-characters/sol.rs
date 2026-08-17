impl Solution {
    pub fn modify_string(s: String) -> String {
        let mut chars: Vec<char> = s.chars().collect();
        let n = chars.len();
        for i in 0..n {
            if chars[i] == '?' {
                let left = if i > 0 { chars[i-1] } else { ' ' };
                let right = if i+1 < n { chars[i+1] } else { ' ' };
                if left != 'a' && right != 'a' {
                    chars[i] = 'a';
                } else if left != 'b' && right != 'b' {
                    chars[i] = 'b';
                } else {
                    chars[i] = 'c';
                }
            }
        }
        chars.into_iter().collect()
    }
}
