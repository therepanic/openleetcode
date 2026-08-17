impl Solution {
    pub fn min_operations(nums: Vec<i32>) -> i32 {
        let mut sum_bits = 0;
        let mut max_num = 0;
        for &num in &nums {
            sum_bits += num.count_ones() as i32;
            if num > max_num {
                max_num = num;
            }
        }
        let doubling: i32 = if max_num > 0 {
            ((32 - max_num.leading_zeros()) - 1) as i32
        } else { 0 };
        sum_bits + doubling
    }
}
