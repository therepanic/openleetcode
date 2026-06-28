impl Solution {
    pub fn valid_palindrome(s: String) -> bool {
        fn is_palindrome(s: &[u8], mut l: usize, mut r: usize) -> bool {
            while l < r {
                if s[l] != s[r] {
                    return false;
                }
                l += 1;
                r -= 1;
            }
            true
        }
        
        let bytes = s.as_bytes();
        let mut left = 0;
        let mut right = bytes.len() - 1;
        while left < right {
            if bytes[left] != bytes[right] {
                return is_palindrome(bytes, left + 1, right) || is_palindrome(bytes, left, right - 1);
            }
            left += 1;
            right -= 1;
        }
        true
    }
}
