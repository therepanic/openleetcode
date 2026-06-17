impl Solution {
    pub fn is_perfect_square(num: i32) -> bool {
        if num < 2 {
            return true;
        }

        let mut left = 2i64;
        let mut right = (num / 2) as i64;
        while left <= right {
            let mid = left + (right - left) / 2;
            let squared = mid * mid;
            if squared == num as i64 {
                return true;
            } else if squared < num as i64 {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        false
    }
}
