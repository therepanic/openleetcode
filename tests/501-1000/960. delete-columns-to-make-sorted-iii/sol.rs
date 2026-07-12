impl Solution {
    pub fn min_deletion_size(strs: Vec<String>) -> i32 {
        let m = strs[0].len();
        let mut dp = vec![1; m];
        
        for i in 0..m {
            for j in 0..i {
                let all = strs.iter().all(|row| {
                    row.as_bytes()[j] <= row.as_bytes()[i]
                });
                
                if all {
                    dp[i] = dp[i].max(dp[j] + 1);
                }
            }
        }
        
        (m as i32) - (*dp.iter().max().unwrap() as i32)
    }
}
