impl Solution {
    pub fn least_interval(tasks: Vec<char>, n: i32) -> i32 {
        let mut count = std::collections::HashMap::new();
        for t in &tasks {
            *count.entry(*t).or_insert(0) += 1;
        }
        let f_max = *count.values().max().unwrap();
        let max_count = count.values().filter(|&&v| v == f_max).count() as i32;
        std::cmp::max(tasks.len() as i32, (f_max - 1) * (n + 1) + max_count)
    }
}
