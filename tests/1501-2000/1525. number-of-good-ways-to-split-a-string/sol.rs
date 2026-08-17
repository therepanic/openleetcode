impl Solution {
    pub fn num_splits(s: String) -> i32 {
        let n = s.len();
        let mut counter = 0;
        let mut distinct_left: std::collections::HashMap<char, i32> = std::collections::HashMap::new();
        let mut distinct_right: std::collections::HashMap<char, i32> = std::collections::HashMap::new();

        for c in s.chars() {
            *distinct_right.entry(c).or_insert(0) += 1;
        }
        for (i, c) in s.chars().enumerate().take(n.saturating_sub(1)) {
            *distinct_left.entry(c).or_insert(0) += 1;
            *distinct_right.entry(c).or_insert(0) -= 1;
            if distinct_right[&c] == 0 {
                distinct_right.remove(&c);
            }
            if distinct_left.len() == distinct_right.len() {
                counter += 1;
            }
        }

        counter
    }
}
