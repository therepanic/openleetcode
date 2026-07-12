impl Solution {
    pub fn consecutive_numbers_sum(n: i32) -> i32 {
        let n = n as i64;
        let max_sequence_length = (((1.0 + 8.0 * n as f64).sqrt() - 1.0) / 2.0) as i32;
        let mut c = 0;
        for i in 2..=max_sequence_length {
            if i % 2 == 1 && n % i as i64 == 0 {
                c += 1;
            } else if i % 2 == 0 && n % i as i64 == (i / 2) as i64 {
                c += 1;
            }
        }
        c + 1
    }
}
