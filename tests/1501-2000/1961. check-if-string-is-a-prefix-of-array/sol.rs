impl Solution {
    pub fn is_prefix_string(s: String, words: Vec<String>) -> bool {
        let mut res = String::new();
        let mut i = 0;
        while res.len() < s.len() {
            if i >= words.len() {
                return false;
            }
            res.push_str(&words[i]);
            i += 1;
        }
        res == s
    }
}
