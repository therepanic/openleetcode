impl Solution {
    pub fn minimum_xor_sum(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        let n = nums1.len();
        let full_mask = 1 << n;
        let mut dp = vec![2147483647; full_mask];
        dp[0] = 0;
        for mask in 0..full_mask {
            let idx = mask.count_ones() as usize;
            if idx >= n { continue; }
            for j in 0..n {
                if (mask & (1 << j)) == 0 {
                    let next_mask = mask | (1 << j);
                    let cost = dp[mask] + (nums1[idx] ^ nums2[j]);
                    if cost < dp[next_mask] {
                        dp[next_mask] = cost;
                    }
                }
            }
        }
        dp[full_mask - 1]
    }
}
