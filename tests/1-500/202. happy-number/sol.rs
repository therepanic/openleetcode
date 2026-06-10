use std::collections::HashSet;

impl Solution {
    pub fn is_happy(mut n: i32) -> bool {
        let mut seen = HashSet::new();
        while n != 1 && seen.insert(n) {
            n = Self::next_value(n);
        }
        n == 1
    }

    fn next_value(mut n: i32) -> i32 {
        let mut total = 0;
        while n > 0 {
            let digit = n % 10;
            total += digit * digit;
            n /= 10;
        }
        total
    }
}
