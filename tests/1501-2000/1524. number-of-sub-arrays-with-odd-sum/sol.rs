impl Solution {
    pub fn num_of_subarrays(arr: Vec<i32>) -> i32 {
        let mut odd_count: i64 = 0;
        let mut prefix_sum: i64 = 0;
        let mod_val: i64 = 1_000_000_007;
        for &a in &arr {
            prefix_sum += a as i64;
            odd_count += prefix_sum % 2;
        }
        odd_count += (arr.len() as i64 - odd_count) * odd_count;
        (odd_count % mod_val) as i32
    }
}
