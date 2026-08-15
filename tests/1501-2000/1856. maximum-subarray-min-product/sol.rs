impl Solution {
    pub fn max_sum_min_product(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut prefix = vec![0i64; n + 1];
        for i in 0..n {
            prefix[i+1] = prefix[i] + nums[i] as i64;
        }
        
        let mut left_bound = vec![-1i32; n];
        let mut right_bound = vec![n as i32; n];
        let mut st: Vec<usize> = Vec::new();
        for i in 0..n {
            while let Some(&top) = st.last() {
                if nums[top] > nums[i] {
                    right_bound[top] = i as i32;
                    st.pop();
                } else {
                    break;
                }
            }
            st.push(i);
        }
        st.clear();
        for i in (0..n).rev() {
            while let Some(&top) = st.last() {
                if nums[top] > nums[i] {
                    left_bound[top] = i as i32;
                    st.pop();
                } else {
                    break;
                }
            }
            st.push(i);
        }
        
        let mut max_prod: i64 = 0;
        for i in 0..n {
            let l = left_bound[i] as usize;
            let r = right_bound[i] as usize;
            let total_sum = prefix[r] - prefix[l+1];
            max_prod = max_prod.max(nums[i] as i64 * total_sum);
        }
        (max_prod % 1_000_000_007) as i32
    }
}
