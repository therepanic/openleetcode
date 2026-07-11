impl Solution {
    pub fn largest_vals_from_labels(values: Vec<i32>, labels: Vec<i32>, num_wanted: i32, use_limit: i32) -> i32 {
        let n = values.len();
        let mut pairs: Vec<(i32, i32)> = (0..n).map(|i| (values[i], labels[i])).collect();
        pairs.sort_by(|a, b| b.0.cmp(&a.0));
        let mut res = 0;
        let mut freq = std::collections::HashMap::new();
        let mut wanted = num_wanted;
        for (value, label) in pairs {
            if wanted == 0 {
                break;
            }
            let count = freq.entry(label).or_insert(0);
            if *count < use_limit {
                res += value;
                *count += 1;
                wanted -= 1;
            }
        }
        res
    }
}
