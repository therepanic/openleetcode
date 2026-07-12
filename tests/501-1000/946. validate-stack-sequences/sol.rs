impl Solution {
    pub fn validate_stack_sequences(pushed: Vec<i32>, popped: Vec<i32>) -> bool {
        let mut st = Vec::new();
        let mut j = 0;
        for x in pushed {
            st.push(x);
            while !st.is_empty() && j < popped.len() && *st.last().unwrap() == popped[j] {
                st.pop();
                j += 1;
            }
        }
        j == popped.len()
    }
}
