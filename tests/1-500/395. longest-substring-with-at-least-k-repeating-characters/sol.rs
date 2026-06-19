impl Solution {
    pub fn longest_substring(s: String, k: i32) -> i32 {
        let mut longest_len = 0;
        let n = s.len();
        let bytes = s.as_bytes();

        for target_unique_chars in 1..=26 {
            let mut char_freq = [0; 26];
            let mut unique_chars = 0;
            let mut chars_meeting_k_freq = 0;
            let mut left = 0;

            for right in 0..n {
                let curr_idx = (bytes[right] - b'a') as usize;

                if char_freq[curr_idx] == 0 {
                    unique_chars += 1;
                }
                if char_freq[curr_idx] == k - 1 {
                    chars_meeting_k_freq += 1;
                }
                char_freq[curr_idx] += 1;

                while unique_chars > target_unique_chars {
                    let left_idx = (bytes[left] - b'a') as usize;

                    if char_freq[left_idx] == 1 {
                        unique_chars -= 1;
                    }
                    if char_freq[left_idx] == k {
                        chars_meeting_k_freq -= 1;
                    }
                    char_freq[left_idx] -= 1;
                    left += 1;
                }

                if unique_chars == target_unique_chars && chars_meeting_k_freq == unique_chars {
                    longest_len = longest_len.max((right - left + 1) as i32);
                }
            }
        }

        longest_len
    }

    #[allow(non_snake_case)]
    pub fn longestSubstring(s: String, k: i32) -> i32 {
        Self::longest_substring(s, k)
    }
}
