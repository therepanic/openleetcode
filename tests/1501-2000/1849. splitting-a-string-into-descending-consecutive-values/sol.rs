impl Solution {
    pub fn split_string(s: String) -> bool {
        fn dfs(s: &[u8], index: usize, prev: i64, count: i32) -> bool {
            if index == s.len() {
                return count >= 2;
            }
            
            let mut curr: i64 = 0;
            for i in index..s.len() {
                curr = curr * 10 + (s[i] - b'0') as i64;
                if prev == -1 || prev - curr == 1 {
                    if dfs(s, i + 1, curr, count + 1) {
                        return true;
                    }
                } else if curr >= prev && prev != -1 {
                    break;
                }
            }
            false
        }
        
        let bytes = s.as_bytes();
        dfs(bytes, 0, -1, 0)
    }
}
