impl Solution {
    pub fn longest_palindrome(s: String) -> String {
        if s.is_empty() {
            return String::new();
        }

        let bytes = s.as_bytes();
        let mut start = 0usize;
        let mut best = 1usize;

        for i in 0..bytes.len() {
            let len1 = Self::expand(bytes, i as isize, i as isize);
            let len2 = Self::expand(bytes, i as isize, i as isize + 1);
            let len = if len1 > len2 { len1 } else { len2 };
            if len > best {
                best = len;
                start = i - (len - 1) / 2;
            }
        }

        String::from_utf8(bytes[start..start + best].to_vec()).unwrap()
    }

    fn expand(bytes: &[u8], mut left: isize, mut right: isize) -> usize {
        while left >= 0
            && (right as usize) < bytes.len()
            && bytes[left as usize] == bytes[right as usize]
        {
            left -= 1;
            right += 1;
        }
        (right - left - 1) as usize
    }
}
