impl Solution {
    pub fn find_pairs(nums: Vec<i32>, k: i32) -> i32 {
        if k < 0 {
            return 0;
        }
        let mut count = 0;
        let mut num_counts = std::collections::HashMap::new();
        for &num in &nums {
            *num_counts.entry(num).or_insert(0) += 1;
        }
        for (&num, &freq) in &num_counts {
            if k == 0 {
                if freq >= 2 {
                    count += 1;
                }
            } else {
                if num_counts.contains_key(&(num + k)) {
                    count += 1;
                }
            }
        }
        count
    }
}
