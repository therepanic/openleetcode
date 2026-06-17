impl Solution {
    pub fn max_coins(nums: Vec<i32>) -> i32 {
        let mut balloons = vec![1];
        balloons.extend(nums);
        balloons.push(1);
        let n = balloons.len();
        let mut dp = vec![vec![0; n]; n];
        
        for length in 2..n {
            for left in 0..n-length {
                let right = left + length;
                let mut best = 0;
                for k in left+1..right {
                    let gain = balloons[left] * balloons[k] * balloons[right];
                    let total = gain + dp[left][k] + dp[k][right];
                    if total > best {
                        best = total;
                    }
                }
                dp[left][right] = best;
            }
        }
        
        dp[0][n-1]
    }
}
