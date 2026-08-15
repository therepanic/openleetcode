impl Solution {
    pub fn ways_to_fill_array(queries: Vec<Vec<i32>>) -> Vec<i32> {
        const MOD: i64 = 1_000_000_007;
        
        fn prime_factors(n: i32) -> std::collections::HashMap<i32, i32> {
            let mut map = std::collections::HashMap::new();
            let mut num = n;
            let mut p = 2;
            while p * p <= num {
                while num % p == 0 {
                    *map.entry(p).or_insert(0) += 1;
                    num /= p;
                }
                p += 1;
            }
            if num > 1 {
                *map.entry(num).or_insert(0) += 1;
            }
            map
        }
        
        fn comb(n: i32, r: i32) -> i64 {
            let mut result = 1i64;
            let rr = std::cmp::min(r, n - r);
            for i in 1..=rr {
                result = result * (n - i + 1) as i64 % MOD;
                result = result * mod_pow(i as i64, MOD - 2) % MOD;
            }
            result
        }

        fn mod_pow(mut a: i64, mut e: i64) -> i64 {
            let mut r = 1i64;
            while e > 0 { if e & 1 == 1 { r = r * a % MOD; } a = a * a % MOD; e >>= 1; }
            r
        }
        
        queries.iter().map(|q| {
            let n = q[0];
            let k = q[1];
            let factors = prime_factors(k);
            let mut total: i64 = 1;
            for cnt in factors.values() {
                total = total * comb(n + cnt - 1, n - 1) % MOD;
            }
            total as i32
        }).collect()
    }
}
