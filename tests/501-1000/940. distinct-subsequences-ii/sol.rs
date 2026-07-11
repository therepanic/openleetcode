impl Solution {
    pub fn distinct_subseq_ii(s: String) -> i32 {
        let n = s.len();
        let m = 1000000007i64;
        let mut dp = vec![0i64; n];
        dp[0] = 2;
        let mut mp = std::collections::HashMap::new();
        let chars: Vec<char> = s.chars().collect();
        mp.insert(chars[0], 0);
        for i in 1..n {
            dp[i] = (2 * dp[i-1]) % m;
            if let Some(&idx) = mp.get(&chars[i]) {
                dp[i] -= if idx > 0 { dp[idx-1] } else { 1 };
                if dp[i] < 0 { dp[i] += m; }
            }
            mp.insert(chars[i], i);
            dp[i] %= m;
        }
        ((dp[n-1] - 1 + m) % m) as i32
    }
}
