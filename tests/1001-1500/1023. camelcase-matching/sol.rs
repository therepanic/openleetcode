impl Solution {
    pub fn camel_match(queries: Vec<String>, pattern: String) -> Vec<bool> {
        let mut ans = Vec::new();
        for query in queries {
            let mut j = 0;
            let mut i = 0;
            let query_chars: Vec<char> = query.chars().collect();
            let pattern_chars: Vec<char> = pattern.chars().collect();
            while i < query_chars.len() {
                if query_chars[i].is_uppercase() && ((j < pattern_chars.len() && query_chars[i] != pattern_chars[j]) || j > pattern_chars.len() - 1) {
                    break;
                }
                if j < pattern_chars.len() && query_chars[i] == pattern_chars[j] {
                    j += 1;
                }
                i += 1;
            }
            if i == query_chars.len() && j == pattern_chars.len() {
                ans.push(true);
            } else {
                ans.push(false);
            }
        }
        ans
    }
}
