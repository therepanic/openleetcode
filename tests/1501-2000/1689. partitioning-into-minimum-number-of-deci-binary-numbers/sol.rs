impl Solution {
    pub fn min_partitions(n: String) -> i32 {
        n.chars().map(|c| c.to_digit(10).unwrap() as i32).max().unwrap()
    }
}
