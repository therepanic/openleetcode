impl Solution {
    pub fn length_of_last_word(s: String) -> i32 {
        let bytes = s.as_bytes();
        let mut i = bytes.len() as i32 - 1;

        while i >= 0 && bytes[i as usize] == b' ' {
            i -= 1;
        }

        let mut len = 0;
        while i >= 0 && bytes[i as usize] != b' ' {
            len += 1;
            i -= 1;
        }

        len
    }
}
