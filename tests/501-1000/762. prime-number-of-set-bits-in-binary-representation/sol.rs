impl Solution {
    pub fn count_prime_set_bits(left: i32, right: i32) -> i32 {
        let mut count = 0;
        for i in left..=right {
            let set_bits = i.count_ones() as i32;
            if Self::is_prime(set_bits) {
                count += 1;
            }
        }
        count
    }
    
    fn is_prime(n: i32) -> bool {
        if n <= 1 {
            return false;
        }
        let mut i = 2;
        while i * i <= n {
            if n % i == 0 {
                return false;
            }
            i += 1;
        }
        true
    }
}
