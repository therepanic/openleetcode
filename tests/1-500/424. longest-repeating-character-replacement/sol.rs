impl Solution {
    pub fn character_replacement(s: String, k: i32) -> i32 {
        let s_bytes = s.as_bytes();
        let mut max_count = 0;
        let mut left = 0;
        let mut freq = vec![0; 26];
        
        for right in 0..s_bytes.len() {
            let idx = (s_bytes[right] - b'A') as usize;
            freq[idx] += 1;
            max_count = max_count.max(freq[idx]);
            
            if right - left + 1 - max_count > k as usize {
                let left_idx = (s_bytes[left] - b'A') as usize;
                freq[left_idx] -= 1;
                left += 1;
            }
        }
        
        (s_bytes.len() - left) as i32
    }
}
