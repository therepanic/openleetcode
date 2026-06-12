impl Solution {
    pub fn is_palindrome(s: String) -> bool {
        let bytes = s.as_bytes();
        let mut left = 0usize;
        let mut right = bytes.len();
        while left < right {
            while left < right && !(bytes[left] as char).is_ascii_alphanumeric() { left += 1; }
            while left < right && !(bytes[right - 1] as char).is_ascii_alphanumeric() { right -= 1; }
            if left < right {
                if (bytes[left] as char).to_ascii_lowercase() != (bytes[right - 1] as char).to_ascii_lowercase() { return false; }
                left += 1;
                right -= 1;
            }
        }
        true
    }
}
