impl Solution {
    pub fn min_cut(s: String) -> i32 {
        let chars: Vec<char> = s.chars().collect();
        let n = chars.len();
        let mut is_pal = vec![vec![false; n]; n];
        for end in 0..n {
            for start in 0..=end {
                if chars[start] == chars[end] && (end - start <= 2 || is_pal[start + 1][end - 1]) { is_pal[start][end] = true; }
            }
        }
        let mut dp = vec![0; n];
        for i in 0..n {
            if is_pal[0][i] { dp[i] = 0; } else {
                dp[i] = i as i32;
                for j in 0..i { if is_pal[j + 1][i] { dp[i] = dp[i].min(dp[j] + 1); } }
            }
        }
        dp[n - 1]
    }
}
