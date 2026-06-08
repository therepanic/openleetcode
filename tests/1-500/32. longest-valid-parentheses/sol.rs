impl Solution {
    pub fn longest_valid_parentheses(s: String) -> i32 {
        let mut st = vec![-1];
        let mut ans = 0;
        for (i, ch) in s.chars().enumerate() {
            if ch == '(' {
                st.push(i as i32);
            } else {
                st.pop();
                if st.is_empty() {
                    st.push(i as i32);
                } else {
                    ans = ans.max(i as i32 - *st.last().unwrap());
                }
            }
        }
        ans
    }
}
