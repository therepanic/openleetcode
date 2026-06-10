impl Solution {
    pub fn hamming_weight(n: i32) -> i32 {
        (n as u32).count_ones() as i32
    }
}
