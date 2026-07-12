impl Solution {
    pub fn sample_stats(count: Vec<i32>) -> Vec<f64> {
        fn kth(count: &Vec<i32>, k: i32) -> i32 {
            let mut acc = 0;
            for (v, &c) in count.iter().enumerate() {
                acc += c;
                if acc >= k {
                    return v as i32;
                }
            }
            0
        }

        let mut tot = 0;
        let mut cnt = 0i64;
        let mut mini = -1;
        let mut maxi = 0;
        let mut mode = 0;
        let mut mode_cnt = 0;

        for (v, &c) in count.iter().enumerate() {
            if c > 0 {
                if mini == -1 {
                    mini = v as i32;
                }
                maxi = v as i32;
                tot += c;
                cnt += v as i64 * c as i64;
                if c > mode_cnt {
                    mode_cnt = c;
                    mode = v as i32;
                }
            }
        }

        let m = if tot % 2 == 1 {
            kth(&count, tot / 2 + 1) as f64
        } else {
            (kth(&count, tot / 2) + kth(&count, tot / 2 + 1)) as f64 / 2.0
        };

        vec![mini as f64, maxi as f64, cnt as f64 / tot as f64, m, mode as f64]
    }
}
