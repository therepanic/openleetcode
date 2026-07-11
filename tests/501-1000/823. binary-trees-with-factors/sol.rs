impl Solution {
    pub fn num_factored_binary_trees(arr: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let mut arr = arr;
        arr.sort_unstable();
        let mut dp = std::collections::HashMap::new();
        let s: std::collections::HashSet<i32> = arr.iter().cloned().collect();
        for &x in &arr {
            dp.insert(x, 1i64);
            for &a in &arr {
                if a > x { break; }
                if x % a == 0 {
                    let b = x / a;
                    if s.contains(&b) {
                        let val = dp[&x] + dp[&a] * dp[&b];
                        dp.insert(x, val % MOD);
                    }
                }
            }
        }
        let sum: i64 = dp.values().fold(0, |acc, &v| (acc + v) % MOD);
        sum as i32
    }
}
