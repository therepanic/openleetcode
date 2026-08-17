impl Solution {
    pub fn minimum_length(s: String) -> i32 {
        let s_bytes = s.as_bytes();
        let mut left = 0;
        let mut right = s.len() as i32 - 1;
        while left < right && s_bytes[left as usize] == s_bytes[right as usize] {
            let ch = s_bytes[left as usize];
            while left <= right && s_bytes[left as usize] == ch {
                left += 1;
            }
            while left <= right && s_bytes[right as usize] == ch {
                right -= 1;
            }
        }
        (right - left + 1).max(0)
    }
}
