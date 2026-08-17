impl Solution {
    pub fn number_of_good_subsets(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
        let mut freq = [0i64; 31];
        for x in nums { freq[x as usize] += 1; }
        let mut masks = [0usize; 31];
        for x in 2..=30 {
            let mut y = x; let mut mask = 0usize; let mut ok = true;
            for (bit, &p) in primes.iter().enumerate() {
                if y % (p * p) == 0 { ok = false; break; }
                if y % p == 0 { mask |= 1usize << bit; }
            }
            if ok { masks[x as usize] = mask; }
        }
        let mut dp = [0i64; 1024]; dp[0] = 1;
        for x in 2..=30 {
            let mask = masks[x as usize];
            if mask == 0 || freq[x as usize] == 0 { continue; }
            for state in (0..1024).rev() {
                if state & mask == 0 {
                    let next = state | mask;
                    dp[next] = (dp[next] + dp[state] * freq[x as usize]) % MOD;
                }
            }
        }
        let mut ans = dp[1..].iter().sum::<i64>() % MOD;
        for _ in 0..freq[1] { ans = ans * 2 % MOD; }
        ans as i32
    }
}
