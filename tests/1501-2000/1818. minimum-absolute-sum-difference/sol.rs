impl Solution {
    pub fn min_absolute_sum_diff(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let n = nums1.len();
        let mut sorted_nums1 = nums1.clone();
        sorted_nums1.sort();
        let mut total: i64 = 0;
        let mut max_reduction: i64 = 0;
        
        for i in 0..n {
            let a = nums1[i];
            let b = nums2[i];
            let curr_diff = (a - b).abs() as i64;
            total += curr_diff;
            
            let idx = sorted_nums1.binary_search(&b).unwrap_or_else(|x| x);
            
            if idx < n {
                max_reduction = max_reduction.max(curr_diff - (sorted_nums1[idx] - b).abs() as i64);
            }
            if idx > 0 {
                max_reduction = max_reduction.max(curr_diff - (sorted_nums1[idx - 1] - b).abs() as i64);
            }
        }
        
        ((total - max_reduction) % MOD) as i32
    }
}
