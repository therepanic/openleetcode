impl Solution {
    pub fn reverse_bits(n: i32) -> i64 {
        u32::reverse_bits(n as u32) as i64
    }
}
