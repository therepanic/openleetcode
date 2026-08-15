impl Solution {
    pub fn minimum_size(nums: Vec<i32>, max_operations: i32) -> i32 {
        let mut lo = 1;
        let mut hi = *nums.iter().max().unwrap();
        while lo < hi {
            let mid = (lo + hi) / 2;
            let needed: i64 = nums.iter().map(|&x| ((x - 1) / mid) as i64).sum();
            if needed <= max_operations as i64 {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        lo
    }
}
