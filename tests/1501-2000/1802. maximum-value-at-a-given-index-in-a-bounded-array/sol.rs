impl Solution {
    pub fn max_value(n: i32, index: i32, max_sum: i32) -> i32 {
        let mut l = 0i64;
        let mut r = max_sum as i64;
        let mut result = 1i64;
        while l <= r {
            let mid = (l + r) / 2;
            if Self::is_valid(mid, n as i64, index as i64, max_sum as i64) {
                result = mid;
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        result as i32
    }

    fn is_valid(mid: i64, n: i64, index: i64, max_sum: i64) -> bool {
        let left_count = index;
        let left: i64;
        if mid > left_count {
            left = (mid - left_count + mid - 1) * left_count / 2;
        } else {
            let ones = left_count - (mid - 1);
            left = mid * (mid - 1) / 2 + ones;
        }

        let right_count = n - index - 1;
        let right: i64;
        if mid > right_count {
            right = (mid - 1 + mid - right_count) * right_count / 2;
        } else {
            let ones = right_count - (mid - 1);
            right = mid * (mid - 1) / 2 + ones;
        }

        left + mid + right <= max_sum
    }
}
