use std::collections::HashSet;

impl Solution {
    pub fn second_highest(s: String) -> i32 {
        let digits: HashSet<i32> = s.chars()
            .filter(|c| c.is_digit(10))
            .map(|c| c.to_digit(10).unwrap() as i32)
            .collect();
        if digits.len() > 1 {
            let max = digits.iter().max().unwrap();
            let filtered: Vec<&i32> = digits.iter().filter(|d| *d != max).collect();
            **filtered.iter().max().unwrap()
        } else {
            -1
        }
    }
}
