impl Solution {
    pub fn concatenated_binary(n: i32) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let mut res: i64 = 0;
        let mut bits: i64 = 0;

        for i in 1..=n as i64 {
            if (i & (i - 1)) == 0 {
                bits += 1;
            }
            res = ((res << bits) | i) % MOD;
        }

        res as i32
    }
}
