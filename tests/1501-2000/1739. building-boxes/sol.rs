impl Solution {
    pub fn minimum_boxes(n: i32) -> i32 {
        let (mut lo, mut hi) = (0_i64, 200_000_i64);
        let target = n as i64;
        while lo < hi {
            let mid = (lo + hi + 1) / 2;
            if mid * (mid + 1) * (mid + 2) / 6 <= target { lo = mid; } else { hi = mid - 1; }
        }
        let remaining = target - lo * (lo + 1) * (lo + 2) / 6;
        let mut extra = 0_i64;
        while extra * (extra + 1) / 2 < remaining { extra += 1; }
        (lo * (lo + 1) / 2 + extra) as i32
    }
}
