impl Solution {
    pub fn arrange_coins(n: i32) -> i32 {
        (((8.0 * n as f64 + 1.0).sqrt() - 1.0) / 2.0) as i32
    }
}
