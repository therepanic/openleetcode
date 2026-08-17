impl Solution {
    pub fn can_eat(candies_count: Vec<i32>, queries: Vec<Vec<i32>>) -> Vec<bool> {
        let n = candies_count.len();
        let m = queries.len();
        let mut ans = vec![false; m];
        let mut psum = vec![0i64; n + 1];
        for i in 1..=n {
            psum[i] = psum[i - 1] + candies_count[i - 1] as i64;
        }
        for i in 0..m {
            let t = queries[i][0] as usize;
            let day = queries[i][1] as i64;
            let cap = queries[i][2] as i64;
            let min_days = psum[t] / cap;
            let max_days = psum[t + 1] - 1;
            ans[i] = min_days <= day && day <= max_days;
        }
        ans
    }
}
