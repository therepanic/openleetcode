impl Solution {
    pub fn sum_zero(n: i32) -> Vec<i32> {
        (0..n).map(|i| i * 2 - n + 1).collect()
    }
}
