impl Solution {
    pub fn num_ways(s: String) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let total_ones = s.bytes().filter(|&b| b == b'1').count() as i64;
        
        if total_ones == 0 {
            let n = s.len() as i64;
            return (((n - 1) * (n - 2) / 2) % MOD) as i32;
        }
        
        if total_ones % 3 != 0 {
            return 0;
        }
        
        let ones_per_part = total_ones / 3;
        let mut first_split_ways = 0i64;
        let mut second_split_ways = 0i64;
        let mut count = 0i64;
        
        for byte in s.bytes() {
            if byte == b'1' {
                count += 1;
            }
            if count == ones_per_part {
                first_split_ways += 1;
            } else if count == 2 * ones_per_part {
                second_split_ways += 1;
            }
        }
        
        ((first_split_ways * second_split_ways) % MOD) as i32
    }
}
