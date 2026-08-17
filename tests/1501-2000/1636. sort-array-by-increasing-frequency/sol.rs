impl Solution {
    pub fn frequency_sort(nums: Vec<i32>) -> Vec<i32> {
        use std::collections::HashMap;
        let mut freq: HashMap<i32, i32> = HashMap::new();
        for &num in &nums {
            *freq.entry(num).or_insert(0) += 1;
        }
        let mut result = nums;
        result.sort_by(|a, b| {
            freq.get(a).unwrap_or(&0).cmp(freq.get(b).unwrap_or(&0))
                .then(b.cmp(a))
        });
        result
    }
}
