impl Solution {
    pub fn max_dot_product(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        
        fn dp(
            i: usize,
            j: usize,
            nums1: &Vec<i32>,
            nums2: &Vec<i32>,
            memo: &mut HashMap<(usize, usize), i32>,
        ) -> i32 {
            if i == nums1.len() || j == nums2.len() {
                return i32::MIN;
            }
            if let Some(&val) = memo.get(&(i, j)) {
                return val;
            }
            
            let take = nums1[i] * nums2[j];
            let mut res = take;
            let take_and_continue = dp(i + 1, j + 1, nums1, nums2, memo);
            if take_and_continue != i32::MIN {
                res = res.max(take + take_and_continue);
            }
            res = res.max(dp(i + 1, j, nums1, nums2, memo));
            res = res.max(dp(i, j + 1, nums1, nums2, memo));
            
            memo.insert((i, j), res);
            res
        }
        
        let mut memo = HashMap::new();
        dp(0, 0, &nums1, &nums2, &mut memo)
    }
}
