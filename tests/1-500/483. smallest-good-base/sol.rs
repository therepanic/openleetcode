impl Solution {
    pub fn smallest_good_base(n: String) -> String {
        let num: u128 = n.parse().unwrap();
        let max_m = 127 - num.leading_zeros() as i32;
        for m in (1..=max_m).rev() {
            let mut left: u128 = 2;
            let mut right: u128 = (num as f64).powf(1.0 / m as f64) as u128 + 1;
            while left <= right {
                let mid = left + (right - left) / 2;
                match Self::compare(mid, m as usize, num) {
                    0 => return mid.to_string(),
                    -1 => left = mid + 1,
                    _ => {
                        if mid == 0 {
                            break;
                        }
                        right = mid - 1;
                    }
                }
            }
        }
        (num - 1).to_string()
    }

    fn compare(base: u128, m: usize, n: u128) -> i32 {
        let mut sum: u128 = 1;
        let mut cur: u128 = 1;
        for _ in 0..m {
            match cur.checked_mul(base) {
                Some(v) => cur = v,
                None => return 1,
            }
            match sum.checked_add(cur) {
                Some(v) => {
                    sum = v;
                    if sum > n {
                        return 1;
                    }
                }
                None => return 1,
            }
        }
        if sum == n { 0 } else { -1 }
    }
}
