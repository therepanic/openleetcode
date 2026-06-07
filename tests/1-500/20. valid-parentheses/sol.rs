impl Solution {
    pub fn is_valid(s: String) -> bool {
        let mut st = Vec::new();
        for c in s.chars() {
            match c {
                '(' | '[' | '{' => st.push(c),
                ')' => if st.pop() != Some('(') { return false; },
                ']' => if st.pop() != Some('[') { return false; },
                '}' => if st.pop() != Some('{') { return false; },
                _ => {}
            }
        }
        st.is_empty()
    }
}
