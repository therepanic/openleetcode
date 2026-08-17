impl Solution {
    pub fn max_points(points: Vec<Vec<i32>>) -> i64 {
        let m = points.len();
        let n = points[0].len();
        
        let mut dp: Vec<i64> = points[0].iter().map(|&x| x as i64).collect();
        
        for r in 1..m {
            let mut left = vec![0i64; n];
            let mut right = vec![0i64; n];
            
            left[0] = dp[0];
            for c in 1..n {
                left[c] = left[c-1].max(dp[c] + c as i64);
            }
            
            right[n-1] = dp[n-1] - (n-1) as i64;
            for c in (0..n-1).rev() {
                right[c] = right[c+1].max(dp[c] - c as i64);
            }
            
            let mut new_dp = vec![0i64; n];
            for c in 0..n {
                let best = (left[c] - c as i64).max(right[c] + c as i64);
                new_dp[c] = points[r][c] as i64 + best;
            }
            dp = new_dp;
        }
        
        *dp.iter().max().unwrap()
    }
}
