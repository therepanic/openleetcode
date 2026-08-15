impl Solution {
    pub fn min_non_zero_product(p: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let max_num = (1i64 << p) - 1;
        let count = (1i64 << (p - 1)) - 1;
        
        fn pow_mod(mut x: i64, mut n: i64, mod_val: i64) -> i64 {
            x %= mod_val;
            let mut result = 1;
            while n > 0 {
                if n & 1 == 1 {
                    result = (result * x) % mod_val;
                }
                x = (x * x) % mod_val;
                n >>= 1;
            }
            result
        }
        
        let pow = pow_mod(max_num - 1, count, MOD);
        ((pow * (max_num % MOD)) % MOD) as i32
    }
}
