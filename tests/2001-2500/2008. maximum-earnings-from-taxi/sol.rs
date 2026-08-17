impl Solution {
    pub fn max_taxi_earnings(n: i32, rides: Vec<Vec<i32>>) -> i64 {
        let mut rides = rides;
        rides.sort_by_key(|r| r[1]);
        let mut dp: Vec<(i64, i64)> = vec![(0, 0)];
        
        for ride in &rides {
            let start = ride[0] as i64;
            let end = ride[1] as i64;
            let tip = ride[2] as i64;
            
            let mut lo = 0;
            let mut hi = dp.len();
            while lo < hi {
                let mid = lo + (hi - lo) / 2;
                if dp[mid].0 <= start {
                    lo = mid + 1;
                } else {
                    hi = mid;
                }
            }
            let i = lo - 1;
            let profit = dp[i].1 + end - start + tip;
            
            if profit > dp.last().unwrap().1 {
                dp.push((end, profit));
            }
        }
        
        dp.last().unwrap().1
    }
}
