impl Solution {
    pub fn my_atoi(s: String) -> i32 {
        let bytes = s.as_bytes();
        let mut i = 0;
        while i < bytes.len() && bytes[i] == b' ' {
            i += 1;
        }
        if i == bytes.len() {
            return 0;
        }

        let mut sign: i64 = 1;
        if bytes[i] == b'-' {
            sign = -1;
            i += 1;
        } else if bytes[i] == b'+' {
            i += 1;
        }

        let mut res: i64 = 0;
        while i < bytes.len() && bytes[i].is_ascii_digit() {
            let digit = i64::from(bytes[i] - b'0');
            if sign == 1 {
                if res > i32::MAX as i64 / 10 || (res == i32::MAX as i64 / 10 && digit > 7) {
                    return i32::MAX;
                }
            } else {
                if res > 2147483648_i64 / 10 || (res == 2147483648_i64 / 10 && digit > 8) {
                    return i32::MIN;
                }
            }
            res = res * 10 + digit;
            i += 1;
        }

        (sign * res) as i32
    }
}
