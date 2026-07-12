impl Solution {
    pub fn decode_at_index(s: String, k: i32) -> String {
        let mut size: i64 = 0;
        for ch in s.chars() {
            if ch.is_digit(10) {
                size *= ch.to_digit(10).unwrap() as i64;
            } else {
                size += 1;
            }
        }

        let mut kk = k as i64;
        for ch in s.chars().rev() {
            kk %= size;
            if kk == 0 && ch.is_alphabetic() {
                return ch.to_string();
            }
            if ch.is_digit(10) {
                size /= ch.to_digit(10).unwrap() as i64;
            } else {
                size -= 1;
            }
        }
        String::new()
    }
}
