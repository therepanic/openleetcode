impl Solution {
    pub fn job_scheduling(start_time: Vec<i32>, end_time: Vec<i32>, profit: Vec<i32>) -> i32 {
        let n = start_time.len();
        let mut jobs: Vec<(i32, i32, i32)> = (0..n)
            .map(|i| (start_time[i], end_time[i], profit[i]))
            .collect();
        jobs.sort_by_key(|j| j.0);
        
        let starts: Vec<i32> = jobs.iter().map(|j| j.0).collect();
        let mut dp = vec![0; n + 1];
        
        for i in (0..n).rev() {
            let target = jobs[i].1;
            let idx = starts.partition_point(|&start| start < target);
            let take = jobs[i].2 + dp[idx];
            let not_take = dp[i + 1];
            dp[i] = take.max(not_take);
        }
        dp[0]
    }
}
