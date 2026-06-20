impl Solution {
    pub fn remove_kdigits(num: String, k: i32) -> String {
        let mut s: Vec<char> = Vec::new();
        let mut remaining = k;
        for c in num.chars() {
            while remaining > 0 && !s.is_empty() && s[s.len() - 1] > c {
                s.pop();
                remaining -= 1;
            }
            s.push(c);
        }
        
        s.truncate(s.len() - remaining as usize);
        let result: String = s.into_iter().collect();
        let result = result.trim_start_matches('0').to_string();
        if result.is_empty() { "0".to_string() } else { result }
    }
}
