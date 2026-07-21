impl Solution {
    pub fn palindrome_partition(s: String, k: i32) -> i32 {
        let n = s.len();
        let k = k as usize;
        let bytes = s.as_bytes();
        let mut c = vec![vec![0; n]; n];
        for l in 2..=n {
            for i in 0..=n - l {
                let j = i + l - 1;
                c[i][j] = if l > 2 { c[i + 1][j - 1] } else { 0 } + if bytes[i] != bytes[j] { 1 } else { 0 };
            }
        }
        let mut dp = vec![vec![i32::MAX / 2; n + 1]; k + 1];
        dp[0][0] = 0;
        for i in 1..=n {
            dp[1][i] = c[0][i - 1];
        }
        for p in 2..=k {
            for i in p..=n {
                let mut mn = i32::MAX / 2;
                for t in (p - 1)..i {
                    mn = mn.min(dp[p - 1][t] + c[t][i - 1]);
                }
                dp[p][i] = mn;
            }
        }
        dp[k][n]
    }
}
