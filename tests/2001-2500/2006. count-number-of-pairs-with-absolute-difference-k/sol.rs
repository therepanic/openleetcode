impl Solution {
    pub fn count_k_difference(nums: Vec<i32>, k: i32) -> i32 {
        use std::collections::HashMap;
        let mut c = HashMap::new();
        for &num in &nums {
            *c.entry(num).or_insert(0) += 1;
        }
        c.iter().map(|(&x, &cnt)| cnt * c.get(&(x + k)).unwrap_or(&0)).sum()
    }
}
