impl Solution {
    pub fn num_friend_requests(ages: Vec<i32>) -> i32 {
        let mut cnt = vec![0; 121];
        for &age in &ages {
            cnt[age as usize] += 1;
        }
        let mut pre = vec![0; 122];
        for i in 0..121 {
            pre[i + 1] = pre[i] + cnt[i];
        }
        let mut ans = 0;
        for age in 15..121 {
            if cnt[age] > 0 {
                let lower = ((age as f64) * 0.5 + 7.0) as usize;
                let total = pre[age + 1] - pre[lower + 1];
                ans += cnt[age] * (total - 1);
            }
        }
        ans
    }
}
