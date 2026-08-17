impl Solution {
    pub fn count_routes(locations: Vec<i32>, start: i32, finish: i32, fuel: i32) -> i32 {
        const MOD: i32 = 1000000007;
        let n = locations.len();
        let mut dp = vec![vec![0; (fuel as usize) + 1]; n];
        for city in 0..n {
            dp[city][0] = if city == finish as usize { 1 } else { 0 };
        }
        for left in 1..=(fuel as usize) {
            for city in 0..n {
                let mut total = if city == finish as usize { 1 } else { 0 };
                for nxt in 0..n {
                    if nxt != city {
                        let cost = (locations[nxt] - locations[city]).abs() as usize;
                        if cost <= left {
                            total = (total + dp[nxt][left - cost]) % MOD;
                        }
                    }
                }
                dp[city][left] = total;
            }
        }
        dp[start as usize][fuel as usize]
    }
}
