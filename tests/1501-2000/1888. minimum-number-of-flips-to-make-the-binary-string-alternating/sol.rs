impl Solution {
    pub fn min_flips(s: String) -> i32 {
        let n = s.len();
        let t = s.clone() + &s;
        let chars: Vec<char> = t.chars().collect();
        let mut ans = n as i32;
        let mut mis0 = 0i32;

        for i in 0..(2 * n) {
            let expected0 = if i % 2 == 0 { '0' } else { '1' };
            if chars[i] != expected0 {
                mis0 += 1;
            }

            if i >= n {
                let left = i - n;
                let exp_left = if left % 2 == 0 { '0' } else { '1' };
                if chars[left] != exp_left {
                    mis0 -= 1;
                }
            }

            if i >= n - 1 {
                let mis1 = n as i32 - mis0;
                ans = ans.min(mis0.min(mis1));
            }
        }

        ans
    }
}
