impl Solution {
    pub fn max_length_between_equal_characters(s: String) -> i32 {
        let mut first_pos = vec![-1; 26];
        let mut last_pos = vec![-1; 26];
        let bytes = s.as_bytes();
        let base = b'a';
        for (i, &b) in bytes.iter().enumerate() {
            let idx = (b - base) as usize;
            if first_pos[idx] == -1 {
                first_pos[idx] = i as i32;
            }
        }
        for i in (0..bytes.len()).rev() {
            let idx = (bytes[i] - base) as usize;
            if last_pos[idx] == -1 {
                last_pos[idx] = i as i32;
            }
        }
        let mut max_len = -1;
        for i in 0..26 {
            if first_pos[i] != -1 && last_pos[i] != -1 {
                max_len = max_len.max(last_pos[i] - first_pos[i] - 1);
            }
        }
        max_len
    }
}
