impl Solution {
    pub fn max_value(events: Vec<Vec<i32>>, k: i32) -> i32 {
        let mut events = events;
        events.sort_by_key(|e| e[1]);
        let n = events.len();
        let k = k as usize;
        let mut dp = vec![vec![0; k + 1]; n + 1];
        
        for i in 1..=n {
            let start = events[i - 1][0];
            let value = events[i - 1][2];
            let prev = Self::find_last_non_overlapping(&events, i - 1, start);
            for j in 1..=k {
                dp[i][j] = dp[i - 1][j].max(dp[prev][j - 1] + value);
            }
        }
        dp[n][k]
    }
    
    fn find_last_non_overlapping(events: &Vec<Vec<i32>>, right: usize, target_start: i32) -> usize {
        let mut left = 0;
        let mut res = 0;
        let mut r = right;
        while left <= r {
            let mid = (left + r) / 2;
            if events[mid][1] < target_start {
                res = mid + 1;
                left = mid + 1;
            } else {
                if mid == 0 { break; }
                r = mid - 1;
            }
        }
        res
    }
}
