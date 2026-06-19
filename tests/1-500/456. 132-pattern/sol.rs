impl Solution {
    pub fn find132pattern(nums: Vec<i32>) -> bool {
        let mut st: Vec<(i32, i32)> = Vec::new();
        let mut cur_min = nums[0];

        for &n in &nums[1..] {
            while let Some(&top) = st.last() {
                if n >= top.0 {
                    st.pop();
                } else {
                    break;
                }
            }
            
            if let Some(&top) = st.last() {
                if n > top.1 {
                    return true;
                }
            }
            
            st.push((n, cur_min));
            cur_min = cur_min.min(n);
        }
        
        false
    }
}
