impl Solution {
    pub fn is_subsequence(s: String, t: String) -> bool {
        let mut sp = 0;
        let mut tp = 0;
        let s_bytes = s.as_bytes();
        let t_bytes = t.as_bytes();
        while sp < s_bytes.len() && tp < t_bytes.len() {
            if s_bytes[sp] == t_bytes[tp] {
                sp += 1;
            }
            tp += 1;
        }
        sp == s_bytes.len()
    }

    #[allow(non_snake_case)]
    pub fn isSubsequence(s: String, t: String) -> bool {
        Self::is_subsequence(s, t)
    }
}
