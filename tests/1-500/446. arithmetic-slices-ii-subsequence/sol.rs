use std::collections::HashMap;

impl Solution {
    pub fn number_of_arithmetic_slices(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut total_count = 0;
        let mut dp: Vec<HashMap<i64, i32>> = vec![HashMap::new(); n];

        for i in 1..n {
            for j in 0..i {
                let diff = nums[i] as i64 - nums[j] as i64;
                let entry = dp[i].entry(diff).or_insert(0);
                *entry += 1;
                if let Some(&cnt) = dp[j].get(&diff) {
                    *dp[i].get_mut(&diff).unwrap() += cnt;
                    total_count += cnt;
                }
            }
        }

        total_count
    }
}
