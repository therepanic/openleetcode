impl Solution {
    pub fn is_possible(nums: Vec<i32>) -> bool {
        let mut count = std::collections::HashMap::new();
        let mut subseq = std::collections::HashMap::new();

        for &num in &nums {
            *count.entry(num).or_insert(0) += 1;
        }

        for &num in &nums {
            if *count.get(&num).unwrap_or(&0) == 0 {
                continue;
            }
            if *subseq.get(&(num - 1)).unwrap_or(&0) > 0 {
                *subseq.entry(num - 1).or_insert(0) -= 1;
                *subseq.entry(num).or_insert(0) += 1;
            } else if *count.get(&(num + 1)).unwrap_or(&0) > 0 && *count.get(&(num + 2)).unwrap_or(&0) > 0 {
                *count.entry(num + 1).or_insert(0) -= 1;
                *count.entry(num + 2).or_insert(0) -= 1;
                *subseq.entry(num + 2).or_insert(0) += 1;
            } else {
                return false;
            }
            *count.entry(num).or_insert(0) -= 1;
        }

        true
    }
}
