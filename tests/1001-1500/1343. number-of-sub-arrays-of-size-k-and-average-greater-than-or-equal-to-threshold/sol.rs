impl Solution {
    pub fn num_of_subarrays(arr: Vec<i32>, k: i32, threshold: i32) -> i32 {
        let mut res = 0;
        let mut left = 0;
        let mut total = 0;
        let k_usize = k as usize;
        for right in 0..arr.len() {
            total += arr[right];
            if right - left + 1 == k_usize {
                if total / k >= threshold {
                    res += 1;
                }
                total -= arr[left];
                left += 1;
            }
        }
        res
    }
}
