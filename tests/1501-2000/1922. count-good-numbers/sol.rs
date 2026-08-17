impl Solution {
    pub fn count_good_numbers(n: i64) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let even_positions = (n + 1) / 2;
        let odd_positions = n / 2;
        
        let even_ways = Self::chakra_power(5, even_positions, MOD);
        let odd_ways = Self::chakra_power(4, odd_positions, MOD);
        
        ((even_ways * odd_ways) % MOD) as i32
    }
    
    fn chakra_power(base: i64, power: i64, modulus: i64) -> i64 {
        let mut result = 1;
        let mut b = base % modulus;
        let mut p = power;
        while p > 0 {
            if p % 2 == 1 {
                result = (result * b) % modulus;
            }
            b = (b * b) % modulus;
            p /= 2;
        }
        result
    }
}
