impl Solution {
    pub fn evaluate(s: String, knowledge: Vec<Vec<String>>) -> String {
        let mut mp = std::collections::HashMap::new();
        for pair in knowledge {
            mp.insert(pair[0].clone(), pair[1].clone());
        }
        let bytes = s.as_bytes();
        let mut ans = String::new();
        let mut i = 0;
        let n = bytes.len();
        while i < n {
            if bytes[i] == b'(' {
                i += 1;
                let mut temp = String::new();
                while i < n && bytes[i] != b')' {
                    temp.push(bytes[i] as char);
                    i += 1;
                }
                ans.push_str(mp.get(&temp).map(|s| s.as_str()).unwrap_or("?"));
                i += 1;
            } else {
                ans.push(bytes[i] as char);
                i += 1;
            }
        }
        ans
    }
}
