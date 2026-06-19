impl Solution {
    pub fn compress(chars: &mut Vec<char>) -> i32 {
        let mut i = 0;
        let mut j = 0;
        while j < chars.len() {
            let c = chars[j];
            let mut count = 0;
            while j < chars.len() && chars[j] == c {
                j += 1;
                count += 1;
            }
            chars[i] = c;
            i += 1;
            if count > 1 {
                for ch in count.to_string().chars() {
                    chars[i] = ch;
                    i += 1;
                }
            }
        }
        i as i32
    }
}
