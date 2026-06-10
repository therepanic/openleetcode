impl Solution {
    pub fn single_number(nums: Vec<i32>) -> i32 {
        use std::collections::HashSet;

        let total_sum: i64 = nums.iter().map(|&num| num as i64).sum();
        let unique_sum: i64 = nums
            .iter()
            .copied()
            .collect::<HashSet<i32>>()
            .into_iter()
            .map(|num| num as i64)
            .sum();
        ((3 * unique_sum - total_sum) >> 1) as i32
    }
}
