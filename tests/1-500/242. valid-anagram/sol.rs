impl Solution {
    pub fn is_anagram(s: String, t: String) -> bool {
        if s.len() != t.len() {
            return false;
        }
        
        let mut arr = [0; 26];
        let s_bytes = s.as_bytes();
        let t_bytes = t.as_bytes();
        
        for i in 0..s.len() {
            arr[(s_bytes[i] - b'a') as usize] += 1;
            arr[(t_bytes[i] - b'a') as usize] -= 1;
        }
        
        for check in arr.iter() {
            if *check != 0 {
                return false;
            }
        }
        
        true
    }
}
