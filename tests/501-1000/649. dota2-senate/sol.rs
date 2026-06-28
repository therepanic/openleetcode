impl Solution {
    pub fn predict_party_victory(senate: String) -> String {
        let mut r = std::collections::VecDeque::new();
        let mut d = std::collections::VecDeque::new();
        let n = senate.len();
        
        for (i, c) in senate.chars().enumerate() {
            if c == 'R' {
                r.push_back(i);
            } else {
                d.push_back(i);
            }
        }
        
        while !r.is_empty() && !d.is_empty() {
            let r_idx = r.pop_front().unwrap();
            let d_idx = d.pop_front().unwrap();
            
            if r_idx < d_idx {
                r.push_back(r_idx + n);
            } else {
                d.push_back(d_idx + n);
            }
        }
        
        if r.is_empty() { "Dire".to_string() } else { "Radiant".to_string() }
    }
}
