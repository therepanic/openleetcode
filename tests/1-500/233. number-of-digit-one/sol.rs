impl Solution {
    pub fn count_digit_one(n: i32) -> i32 {
        let mut count: i64 = 0;
        let mut factor: i64 = 1;
        let n = n as i64;
        while factor <= n {
            let lower = n % factor;
            let cur = (n / factor) % 10;
            let higher = n / (factor * 10);
            if cur == 0 {
                count += higher * factor;
            } else if cur == 1 {
                count += higher * factor + lower + 1;
            } else {
                count += (higher + 1) * factor;
            }
            factor *= 10;
        }
        count as i32
    }
}
