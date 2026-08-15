impl Solution {
    pub fn min_elements(nums: Vec<i32>, limit: i32, goal: i32) -> i32 {
        let current_sum: i64 = nums.iter().map(|&x| x as i64).sum();
        let diff = (goal as i64 - current_sum).abs();
        ((diff + limit as i64 - 1) / limit as i64) as i32
    }
}
