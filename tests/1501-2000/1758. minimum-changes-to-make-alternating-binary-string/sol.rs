impl Solution {
    pub fn min_operations(s: String) -> i32 {
        let mut c = 0;
        let mut j = 0;
        let n = s.len() as i32;
        for ch in s.chars() {
            let digit = ch.to_digit(10).unwrap() as i32;
            if digit == j {
                c += 1;
            }
            j ^= 1;
        }
        std::cmp::min(c, n - c)
    }
}
