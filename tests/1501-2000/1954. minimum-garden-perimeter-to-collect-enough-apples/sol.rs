impl Solution {
    pub fn minimum_perimeter(needed_apples: i64) -> i64 {
        let mut lo = 0i64;
        let mut hi = 100000i64;
        while lo < hi {
            let mid = (lo + hi) / 2;
            let apples = 2 * mid * (mid + 1) * (2 * mid + 1);
            if apples >= needed_apples {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        lo * 8
    }
}
