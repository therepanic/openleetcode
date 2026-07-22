impl Solution {
    pub fn count_orders(n: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let mut count: i64 = 1;
        for i in 2..=n as i64 {
            count = (count * (2 * i - 1) * i) % MOD;
        }
        count as i32
    }
}
