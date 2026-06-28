impl Solution {
    pub fn make_largest_special(s: String) -> String {
        let mut count = 0;
        let mut i = 0;
        let mut res = Vec::new();
        
        for j in 0..s.len() {
            count += if s.as_bytes()[j] == b'1' { 1 } else { -1 };
            
            if count == 0 {
                res.push(format!("1{}0", Self::make_largest_special(s[i + 1..j].to_string())));
                i = j + 1;
            }
        }
        
        res.sort_by(|a, b| b.cmp(a));
        res.join("")
    }
}
