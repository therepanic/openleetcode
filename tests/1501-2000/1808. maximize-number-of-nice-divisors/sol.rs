impl Solution {
    pub fn max_nice_divisors(prime_factors: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        if prime_factors == 1 {
            return 1;
        }
        let q = prime_factors / 3;
        let r = prime_factors % 3;
        fn pow_mod(mut a: i64, mut b: i32) -> i64 {
            let mut res = 1;
            while b > 0 {
                if b % 2 == 1 {
                    res = res * a % MOD;
                }
                a = a * a % MOD;
                b /= 2;
            }
            res
        }
        match r {
            0 => pow_mod(3, q) as i32,
            1 => (pow_mod(3, q-1) * 4 % MOD) as i32,
            _ => (pow_mod(3, q) * 2 % MOD) as i32,
        }
    }
}
