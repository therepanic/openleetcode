impl Solution {
    pub fn max_unique_split(s: String) -> i32 {
        let s_chars: Vec<char> = s.chars().collect();
        let mut used = std::collections::HashSet::new();
        let mut ans = 0;
        
        fn backtrack(chars: &[char], start: usize, used: &mut std::collections::HashSet<String>, ans: &mut i32) {
            if start == chars.len() {
                *ans = (*ans).max(used.len() as i32);
                return;
            }
            for end in start..chars.len() {
                let curr: String = chars[start..=end].iter().collect();
                if used.contains(&curr) { continue; }
                used.insert(curr.clone());
                backtrack(chars, end + 1, used, ans);
                used.remove(&curr);
            }
        }
        
        backtrack(&s_chars, 0, &mut used, &mut ans);
        ans
    }
}
