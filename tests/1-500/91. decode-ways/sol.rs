impl Solution {
    pub fn num_decodings(s: String) -> i32 {
        if s.is_empty() {
            return 0;
        }

        let bytes = s.as_bytes();
        if bytes[0] == b'0' {
            return 0;
        }

        let mut prev2 = 1;
        let mut prev1 = 1;
        for i in 1..bytes.len() {
            let mut curr = 0;
            if bytes[i] != b'0' {
                curr += prev1;
            }
            let value = (bytes[i - 1] - b'0') as i32 * 10 + (bytes[i] - b'0') as i32;
            if (10..=26).contains(&value) {
                curr += prev2;
            }
            prev2 = prev1;
            prev1 = curr;
        }

        prev1
    }
}
