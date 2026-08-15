impl Solution {
    pub fn sum_game(num: String) -> bool {
        let n = num.len();
        let half = n / 2;
        let chars: Vec<char> = num.chars().collect();
        let mut sum_left = 0i32;
        let mut sum_right = 0i32;
        let mut q_left = 0i32;
        let mut q_right = 0i32;

        for i in 0..half {
            if chars[i] == '?' {
                q_left += 1;
            } else {
                sum_left += chars[i] as i32 - '0' as i32;
            }
        }

        for i in half..n {
            if chars[i] == '?' {
                q_right += 1;
            } else {
                sum_right += chars[i] as i32 - '0' as i32;
            }
        }

        (sum_left - sum_right) * 2 != (q_right - q_left) * 9
    }
}
