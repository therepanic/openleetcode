impl Solution {
    pub fn number_of_weeks(milestones: Vec<i32>) -> i64 {
        let total: i64 = milestones.iter().map(|&x| x as i64).sum();
        let max_val: i64 = *milestones.iter().max().unwrap_or(&0) as i64;
        if max_val <= total - max_val {
            total
        } else {
            2 * (total - max_val) + 1
        }
    }
}
