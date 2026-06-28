impl Solution {
    pub fn judge_square_sum(c: i32) -> bool {
        let mut left = 0i64;
        let mut right = (c as f64).sqrt() as i64;
        let c = c as i64;
        while left <= right {
            let current_sum = left * left + right * right;
            if current_sum == c {
                return true;
            } else if current_sum < c {
                left += 1;
            } else {
                right -= 1;
            }
        }
        false
    }
}
