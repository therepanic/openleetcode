impl Solution {
    pub fn min_days(bloom_day: Vec<i32>, m: i32, k: i32) -> i32 {
        if (m as i64) * (k as i64) > bloom_day.len() as i64 {
            return -1;
        }
        
        let f = |time_limit: i32| -> bool {
            let mut cntr = 0;
            let mut bouquet_cntr = 0;
            for &day in &bloom_day {
                if day <= time_limit {
                    cntr += 1;
                    if cntr == k {
                        bouquet_cntr += 1;
                        cntr = 0;
                    }
                } else {
                    cntr = 0;
                }
            }
            bouquet_cntr >= m
        };
        
        let s = *bloom_day.iter().min().unwrap();
        let e = *bloom_day.iter().max().unwrap();
        let mut s = s;
        let mut e = e;
        let mut ans = -1;
        
        while s <= e {
            let mid = s + (e - s) / 2;
            if f(mid) {
                ans = mid;
                e = mid - 1;
            } else {
                s = mid + 1;
            }
        }
        
        ans
    }
}
