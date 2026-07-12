impl Solution {
    pub fn bitwise_complement(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let bit_length = 32 - n.leading_zeros();
        let mask = (1 << bit_length) - 1;
        n ^ mask
    }
}
