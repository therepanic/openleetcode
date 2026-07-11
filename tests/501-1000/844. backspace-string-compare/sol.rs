impl Solution {
    pub fn backspace_compare(s: String, t: String) -> bool {
        fn get_next_valid_char_index(s: &[u8], end: i32) -> i32 {
            let mut backspace_count = 0;
            let mut end = end;
            while end >= 0 {
                if s[end as usize] == b'#' {
                    backspace_count += 1;
                } else if backspace_count > 0 {
                    backspace_count -= 1;
                } else {
                    break;
                }
                end -= 1;
            }
            end
        }

        let s_bytes = s.as_bytes();
        let t_bytes = t.as_bytes();
        let mut ps = s_bytes.len() as i32 - 1;
        let mut pt = t_bytes.len() as i32 - 1;

        while ps >= 0 || pt >= 0 {
            ps = get_next_valid_char_index(s_bytes, ps);
            pt = get_next_valid_char_index(t_bytes, pt);

            if ps < 0 && pt < 0 {
                return true;
            }
            if ps < 0 || pt < 0 {
                return false;
            } else if s_bytes[ps as usize] != t_bytes[pt as usize] {
                return false;
            }

            ps -= 1;
            pt -= 1;
        }

        true
    }
}
