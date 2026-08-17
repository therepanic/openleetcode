impl Solution {
    pub fn can_convert_string(s: String, t: String, k: i32) -> bool {
        if s.len() != t.len() { return false; }
        let s_bytes = s.as_bytes();
        let t_bytes = t.as_bytes();
        let mut shift_count = vec![0i32; 26];
        for i in 0..s_bytes.len() {
            if s_bytes[i] == t_bytes[i] { continue; }
            let diff = ((t_bytes[i] as i32 - s_bytes[i] as i32) % 26 + 26) % 26;
            shift_count[diff as usize] += 1;
            if diff + 26 * (shift_count[diff as usize] - 1) > k { return false; }
        }
        true
    }
}
