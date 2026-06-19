impl Solution {
    pub fn total_hamming_distance(nums: Vec<i32>) -> i32 {
        let mut total = 0;
        let n = nums.len() as i32;
        for i in 0..32 {
            let mut ones = 0;
            for &num in &nums {
                ones += (num >> i) & 1;
            }
            total += ones * (n - ones);
        }
        total
    }
}
