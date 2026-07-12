impl Solution {
    pub fn find_replace_string(s: String, indices: Vec<i32>, sources: Vec<String>, targets: Vec<String>) -> String {
        use std::collections::HashMap;
        let mut patch: HashMap<usize, (&str, &str)> = HashMap::new();
        for k in 0..indices.len() {
            let i = indices[k] as usize;
            let src = sources[k].as_str();
            let tgt = targets[k].as_str();
            if i + src.len() <= s.len() && &s[i..i+src.len()] == src {
                patch.insert(i, (src, tgt));
            }
        }
        let mut res = String::new();
        let mut i = 0;
        let n = s.len();
        while i < n {
            if let Some(&(src, tgt)) = patch.get(&i) {
                res.push_str(tgt);
                i += src.len();
            } else {
                res.push(s.as_bytes()[i] as char);
                i += 1;
            }
        }
        res
    }
}
