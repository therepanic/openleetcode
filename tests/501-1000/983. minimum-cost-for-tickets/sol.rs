impl Solution {
    pub fn mincost_tickets(days: Vec<i32>, costs: Vec<i32>) -> i32 {
        let n = days.len();
        let mut left7 = 0;
        let mut left30 = 0;
        let mut dp = vec![0; n];
        
        for right in 0..n {
            while days[right] - days[left7] >= 7 {
                left7 += 1;
            }
            while days[right] - days[left30] >= 30 {
                left30 += 1;
            }
            
            let cost1 = (if right > 0 { dp[right - 1] } else { 0 }) + costs[0];
            let cost7 = (if left7 > 0 { dp[left7 - 1] } else { 0 }) + costs[1];
            let cost30 = (if left30 > 0 { dp[left30 - 1] } else { 0 }) + costs[2];
            
            dp[right] = cost1.min(cost7).min(cost30);
        }
        
        dp[n - 1]
    }
}
