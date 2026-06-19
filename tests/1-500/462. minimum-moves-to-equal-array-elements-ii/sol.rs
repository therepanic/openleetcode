impl Solution {
    pub fn min_moves2(nums: Vec<i32>) -> i64 {
        let mut nums = nums;
        nums.sort();
        let median = nums[nums.len() / 2];
        nums.iter().map(|&num| (num as i64 - median as i64).abs()).sum()
    }
}
