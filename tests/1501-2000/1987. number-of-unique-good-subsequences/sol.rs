impl Solution {
    pub fn number_of_unique_good_subsequences(binary: String) -> i32 {
        let mut a: i64 = 0;
        let mut b: i64 = 0;
        let mut z: i64 = 0;
        let modulo: i64 = 1_000_000_007;
        for c in binary.chars() {
            if c == '1' {
                b = (a + b + 1) % modulo;
            } else {
                a = (a + b) % modulo;
                z = 1;
            }
        }
        ((a + b + z) % modulo) as i32
    }
}
