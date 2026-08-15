impl Solution {
    pub fn subset_xor_sum(nums: Vec<i32>) -> i32 {
        let mut total = 0;
        for num in &nums {
            total |= num;
        }
        total * (1 << (nums.len() - 1))
    }
}
