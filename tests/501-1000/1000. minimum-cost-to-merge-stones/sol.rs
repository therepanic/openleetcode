impl Solution {
    pub fn merge_stones(stones: Vec<i32>, k: i32) -> i32 {
        let n = stones.len();
        let k = k as usize;
        if (n - 1) % (k - 1) != 0 {
            return -1;
        }
        
        let mut prefix = vec![0; n + 1];
        for i in 1..=n {
            prefix[i] = prefix[i - 1] + stones[i - 1];
        }
        
        let mut dp = vec![vec![vec![i32::MAX; k + 1]; n]; n];
        
        for i in 0..n {
            dp[i][i][1] = 0;
        }
        
        for len in 2..=n {
            for i in 0..=(n - len) {
                let j = i + len - 1;
                for p in 2..=k {
                    let mut m = i;
                    while m < j {
                        if dp[i][m][1] != i32::MAX && dp[m + 1][j][p - 1] != i32::MAX {
                            dp[i][j][p] = dp[i][j][p].min(dp[i][m][1] + dp[m + 1][j][p - 1]);
                        }
                        m += k - 1;
                    }
                }
                if dp[i][j][k] != i32::MAX {
                    dp[i][j][1] = dp[i][j][k] + (prefix[j + 1] - prefix[i]);
                }
            }
        }
        
        if dp[0][n - 1][1] == i32::MAX {
            -1
        } else {
            dp[0][n - 1][1]
        }
    }
}
