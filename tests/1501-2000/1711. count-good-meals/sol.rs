impl Solution {
    pub fn count_pairs(deliciousness: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let max_val = deliciousness.iter().max().unwrap_or(&0);
        let powers: Vec<i32> = (0..22).map(|i| 1 << i).collect();
        let mut count = std::collections::HashMap::new();
        let mut res: i64 = 0;

        for &val in &deliciousness {
            for &target in &powers {
                let complement = target - val;
                if let Some(&c) = count.get(&complement) {
                    res += c as i64;
                    res %= MOD;
                }
            }
            *count.entry(val).or_insert(0) += 1;
        }
        res as i32
    }
}
