impl Solution {
    pub fn stone_game_vii(stones: Vec<i32>) -> i32 {
        let n = stones.len();
        let mut prefix = vec![0; n + 1];
        
        for i in 0..n {
            prefix[i + 1] = prefix[i] + stones[i];
        }
        
        let mut dp = vec![vec![0; n]; n];

        for length in 2..=n {
            for i in 0..=(n - length) {
                let j = i + length - 1;
                let total = prefix[j + 1] - prefix[i];
                dp[i][j] = std::cmp::max(
                    total - stones[i] - dp[i + 1][j],
                    total - stones[j] - dp[i][j - 1]
                );
            }
        }

        dp[0][n - 1]
    }
}
