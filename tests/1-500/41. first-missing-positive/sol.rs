use std::collections::HashSet;

impl Solution {
    pub fn first_missing_positive(nums: Vec<i32>) -> i32 {
        let seen: HashSet<i32> = nums.into_iter().collect();
        let mut i = 1;
        while seen.contains(&i) {
            i += 1;
        }
        i
    }
}
