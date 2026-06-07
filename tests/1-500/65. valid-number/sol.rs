impl Solution {
    pub fn is_number(s: String) -> bool {
        let bytes = s.as_bytes();
        let mut seen_digit = false;
        let mut seen_dot = false;
        let mut seen_exp = false;
        let mut seen_digit_after_exp = true;

        for i in 0..bytes.len() {
            let c = bytes[i];
            if c.is_ascii_digit() {
                seen_digit = true;
                seen_digit_after_exp = true;
            } else if c == b'.' {
                if seen_dot || seen_exp {
                    return false;
                }
                seen_dot = true;
            } else if c == b'e' || c == b'E' {
                if seen_exp || !seen_digit {
                    return false;
                }
                seen_exp = true;
                seen_digit_after_exp = false;
            } else if c == b'+' || c == b'-' {
                if i > 0 && bytes[i - 1] != b'e' && bytes[i - 1] != b'E' {
                    return false;
                }
            } else {
                return false;
            }
        }

        seen_digit && seen_digit_after_exp
    }
}
