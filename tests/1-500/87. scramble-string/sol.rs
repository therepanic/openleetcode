use std::collections::HashMap;

impl Solution {
    pub fn is_scramble(s1: String, s2: String) -> bool {
        let mut memo = HashMap::new();
        Self::dfs(&s1, &s2, &mut memo)
    }

    fn dfs(a: &str, b: &str, memo: &mut HashMap<String, bool>) -> bool {
        if a == b {
            return true;
        }
        let key = format!("{}#{}", a, b);
        if let Some(&v) = memo.get(&key) {
            return v;
        }
        let mut cnt = [0; 26];
        for &ch in a.as_bytes() {
            cnt[(ch - b'a') as usize] += 1;
        }
        for &ch in b.as_bytes() {
            cnt[(ch - b'a') as usize] -= 1;
        }
        if cnt.iter().any(|&x| x != 0) {
            memo.insert(key, false);
            return false;
        }
        let n = a.len();
        for i in 1..n {
            if Self::dfs(&a[..i], &b[..i], memo) && Self::dfs(&a[i..], &b[i..], memo) {
                memo.insert(key, true);
                return true;
            }
            if Self::dfs(&a[..i], &b[n - i..], memo) && Self::dfs(&a[i..], &b[..n - i], memo) {
                memo.insert(key, true);
                return true;
            }
        }
        memo.insert(key, false);
        false
    }
}
