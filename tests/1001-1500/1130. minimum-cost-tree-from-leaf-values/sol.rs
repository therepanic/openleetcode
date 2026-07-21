impl Solution {
    pub fn mct_from_leaf_values(arr: Vec<i32>) -> i32 {
        let mut result = 0;
        let mut st: Vec<i32> = vec![i32::MAX];

        for &a in &arr {
            while st[st.len() - 1] <= a {
                let mid = st.pop().unwrap();
                result += mid * st[st.len() - 1].min(a);
            }
            st.push(a);
        }

        let mut first = st.pop().unwrap();
        while st.len() > 1 {
            result += first * st[st.len() - 1];
            first = st.pop().unwrap();
        }

        result
    }
}
