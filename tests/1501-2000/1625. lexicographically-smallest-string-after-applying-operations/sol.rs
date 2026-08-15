use std::collections::HashSet;

impl Solution {
    pub fn find_lex_smallest_string(s: String, a: i32, b: i32) -> String {
        let n = s.len();
        let mut seen = HashSet::new();
        let mut s = s;
        fn dfs(s: &mut String, a: i32, b: i32, seen: &mut HashSet<String>) {
            if seen.contains(s) { return; }
            seen.insert(s.clone());
            let mut add = s.clone();
            let bytes = unsafe { add.as_bytes_mut() };
            for i in (1..bytes.len()).step_by(2) {
                bytes[i] = ((bytes[i] - b'0' + a as u8) % 10 + b'0') as u8;
            }
            dfs(&mut add, a, b, seen);
            let len = s.len();
            let rot = format!("{}{}", &s[len-b as usize..], &s[..len-b as usize]);
            dfs(&mut rot.clone(), a, b, seen);
        }
        dfs(&mut s, a, b, &mut seen);
        let mut min_str = s.clone();
        for st in &seen {
            if st < &min_str { min_str = st.clone(); }
        }
        min_str
    }
}
