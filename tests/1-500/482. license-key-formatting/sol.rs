impl Solution {
    pub fn license_key_formatting(s: String, k: i32) -> String {
        let s: String = s.replace("-", "").to_uppercase();
        let k = k as usize;
        let mut result: Vec<&str> = Vec::new();
        let len = s.len();
        let mut i = len;
        while i > 0 {
            let start = if i >= k { i - k } else { 0 };
            result.insert(0, &s[start..i]);
            i = if i >= k { i - k } else { 0 };
        }
        result.join("-")
    }
}
