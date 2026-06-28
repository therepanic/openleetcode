impl Solution {
    pub fn cherry_pickup(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        
        let mut dp = vec![vec![i32::MIN; n]; n];
        dp[0][0] = 0;
        
        for k in 0..=2 * (n - 1) {
            let mut new_dp = vec![vec![i32::MIN; n]; n];
            
            for x1 in 0..n {
                let y1 = k as i32 - x1 as i32;
                if !(y1 >= 0 && y1 < n as i32) {
                    continue;
                }
                let y1 = y1 as usize;
                
                for x2 in 0..n {
                    let y2 = k as i32 - x2 as i32;
                    if !(y2 >= 0 && y2 < n as i32) {
                        continue;
                    }
                    let y2 = y2 as usize;
                    
                    if grid[x1][y1] == -1 || grid[x2][y2] == -1 {
                        continue;
                    }
                    
                    let mut best = dp[x1][x2];
                    if x1 > 0 {
                        best = best.max(dp[x1-1][x2]);
                    }
                    if x2 > 0 {
                        best = best.max(dp[x1][x2-1]);
                    }
                    if x1 > 0 && x2 > 0 {
                        best = best.max(dp[x1-1][x2-1]);
                    }
                    
                    if best == i32::MIN {
                        continue;
                    }
                    
                    best += grid[x1][y1];
                    if x1 != x2 {
                        best += grid[x2][y2];
                    }
                    
                    new_dp[x1][x2] = best;
                }
            }
            
            dp = new_dp;
        }
        
        std::cmp::max(0, dp[n-1][n-1])
    }
}
