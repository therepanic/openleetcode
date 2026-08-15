impl Solution {
    pub fn number_of_combinations(num: String) -> i32 {
        let n = num.len();
        let MOD = 1_000_000_007i64;
        let bytes = num.as_bytes();
        let mut dp = vec![vec![0i64; n + 1]; n];
        for i in 0..n {
            if bytes[i] != b'0' {
                for j in i + 1..=n {
                    if i == 0 {
                        dp[i][j] = 1;
                    } else {
                        let length = j - i;
                        dp[i][j] = dp[i][j - 1];
                        if i >= length && &num[i - length..i] <= &num[i..j] {
                            dp[i][j] = (dp[i][j] + dp[i - length][i]) % MOD;
                        }
                        if i + 1 >= length && &num[i - length + 1..i] > &num[i..j - 1] {
                            dp[i][j] = (dp[i][j] + dp[i - length + 1][i]) % MOD;
                        }
                    }
                }
            }
        }
        let mut ans = 0i64;
        for i in 0..n {
            ans = (ans + dp[i][n]) % MOD;
        }
        ans as i32
    }
}
