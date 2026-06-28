impl Solution {
    pub fn find_kth_number(m: i32, n: i32, k: i32) -> i32 {
        let mut lo = 1;
        let mut hi = m * n;
        while lo < hi {
            let mid = lo + (hi - lo) / 2;
            let mut count = 0;
            for i in 1..=m {
                if n < mid / i {
                    count += n;
                } else {
                    count += mid / i;
                }
            }
            if count >= k {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        lo
    }
}
