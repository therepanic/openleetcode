impl Solution {
    pub fn find_nth_digit(n: i32) -> i32 {
        let mut n = n as i64;
        let mut i = 1i64;
        let mut count = 9i64;
        let mut start = 1i64;

        while n > i * count {
            n -= i * count;
            i += 1;
            count *= 10;
            start *= 10;
        }

        let number = start + (n - 1) / i;
        let s = number.to_string();
        return s.chars().nth(((n - 1) % i) as usize).unwrap() as i32 - '0' as i32;
    }
}
