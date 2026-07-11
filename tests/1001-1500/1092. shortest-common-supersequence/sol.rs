impl Solution {
    pub fn shortest_common_supersequence(str1: String, str2: String) -> String {
        let s1: Vec<char> = str1.chars().collect();
        let s2: Vec<char> = str2.chars().collect();
        let m = s1.len();
        let n = s2.len();
        let mut dp = vec![vec![0; n + 1]; m + 1];
        
        for i in 1..=m {
            for j in 1..=n {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1];
                } else {
                    dp[i][j] = dp[i-1][j].max(dp[i][j-1]);
                }
            }
        }
        
        let mut i = m;
        let mut j = n;
        let mut result: Vec<char> = Vec::new();
        
        while i > 0 && j > 0 {
            if s1[i-1] == s2[j-1] {
                result.push(s1[i-1]);
                i -= 1;
                j -= 1;
            } else if dp[i-1][j] > dp[i][j-1] {
                result.push(s1[i-1]);
                i -= 1;
            } else {
                result.push(s2[j-1]);
                j -= 1;
            }
        }
        
        while i > 0 {
            result.push(s1[i-1]);
            i -= 1;
        }
        
        while j > 0 {
            result.push(s2[j-1]);
            j -= 1;
        }
        
        result.reverse();
        result.into_iter().collect()
    }
}
