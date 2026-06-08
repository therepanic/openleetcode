impl Solution {
    pub fn my_sqrt(x: i32) -> i32 {
        if x < 2 {
            return x;
        }

        let mut left = 1i64;
        let mut right = (x / 2) as i64;
        let mut ans = 1i64;

        while left <= right {
            let mid = left + (right - left) / 2;
            let square = mid * mid;
            if square == x as i64 {
                return mid as i32;
            }
            if square < x as i64 {
                ans = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        ans as i32
    }
}
