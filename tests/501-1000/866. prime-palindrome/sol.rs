impl Solution {
    pub fn prime_palindrome(n: i32) -> i32 {
        fn is_prime(num: i32) -> bool {
            if num < 2 {
                return false;
            }
            if num % 2 == 0 {
                return num == 2;
            }
            let mut i = 3;
            while i * i <= num {
                if num % i == 0 {
                    return false;
                }
                i += 2;
            }
            true
        }

        let mut n = n;
        if n >= 8 && n <= 11 {
            return 11;
        }

        loop {
            let s = n.to_string();
            if s.len() % 2 == 0 && n > 11 {
                n = 10_i32.pow(s.len() as u32) + 1;
                continue;
            }
            let rev: String = s.chars().rev().collect();
            if s == rev && is_prime(n) {
                return n;
            }
            n += 1;
            if n > 2 && n % 2 == 0 {
                n += 1;
            }
        }
    }
}
