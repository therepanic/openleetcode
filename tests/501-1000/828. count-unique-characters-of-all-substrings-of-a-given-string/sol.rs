impl Solution {
    pub fn unique_letter_string(s: String) -> i32 {
        let n = s.len();
        let bytes = s.as_bytes();
        let mut left = vec![0i32; n];
        let mut right = vec![0i32; n];
        let mut prev = vec![-1i32; 26];

        for i in 0..n {
            let idx = (bytes[i] - b'A') as usize;
            left[i] = prev[idx];
            prev[idx] = i as i32;
        }

        prev = vec![n as i32; 26];

        for i in (0..n).rev() {
            let idx = (bytes[i] - b'A') as usize;
            right[i] = prev[idx];
            prev[idx] = i as i32;
        }

        let mut ans = 0i32;
        for i in 0..n {
            ans += (i as i32 - left[i]) * (right[i] - i as i32);
        }
        ans
    }
}
