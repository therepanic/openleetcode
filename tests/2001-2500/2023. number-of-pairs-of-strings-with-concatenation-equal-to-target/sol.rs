impl Solution {
    pub fn num_of_pairs(nums: Vec<String>, target: String) -> i32 {
        use std::collections::HashMap;

        let mut freq: HashMap<&str, i32> = HashMap::new();
        for num in &nums {
            *freq.entry(num).or_insert(0) += 1;
        }

        let mut total_cnt = 0;

        for num in &nums {
            if target.starts_with(num.as_str()) {
                let remain = &target[num.len()..];

                if remain == num {
                    total_cnt += freq.get(remain).unwrap_or(&0) - 1;
                } else {
                    total_cnt += freq.get(remain).unwrap_or(&0);
                }
            }
        }

        total_cnt
    }
}
