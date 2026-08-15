impl Solution {
    pub fn get_length_of_optimal_compression(s: String, k: i32) -> i32 {
        let n = s.len();
        let s_chars: Vec<char> = s.chars().collect();
        let k = k as usize;
        let mut dp = vec![vec![9999; 110]; 110];
        dp[0][0] = 0;

        for i in 1..=n {
            for j in 0..=k {
                let mut cnt = 0;
                let mut del = 0;
                for l in (1..=i).rev() {
                    if s_chars[l - 1] == s_chars[i - 1] {
                        cnt += 1;
                    } else {
                        del += 1;
                    }
                    if j >= del {
                        let add = if cnt >= 100 { 3 } else if cnt >= 10 { 2 } else if cnt >= 2 { 1 } else { 0 };
                        dp[i][j] = dp[i][j].min(dp[l - 1][j - del] + 1 + add);
                    }
                }
                if j > 0 {
                    dp[i][j] = dp[i][j].min(dp[i - 1][j - 1]);
                }
            }
        }
        dp[n][k] as i32
    }
}
