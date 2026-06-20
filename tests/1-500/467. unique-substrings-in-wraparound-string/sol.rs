impl Solution {
    pub fn find_substring_in_wrapround_string(s: String) -> i32 {
        let mut counts = [0; 26];
        let mut max_len = 0;
        let bytes = s.as_bytes();

        for i in 0..bytes.len() {
            if i > 0 && (bytes[i] as i32 - bytes[i - 1] as i32 + 26) % 26 == 1 {
                max_len += 1;
            } else {
                max_len = 1;
            }
            let idx = (bytes[i] - b'a') as usize;
            if counts[idx] < max_len {
                counts[idx] = max_len;
            }
        }

        counts.iter().sum()
    }
}
