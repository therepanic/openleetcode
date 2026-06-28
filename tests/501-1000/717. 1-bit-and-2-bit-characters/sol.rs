impl Solution {
    pub fn is_one_bit_character(bits: Vec<i32>) -> bool {
        let n = bits.len();
        let mut i = 0;
        while i < n - 1 {
            i += 1 + if bits[i] == 1 { 1 } else { 0 };
        }
        i == n - 1
    }
}
