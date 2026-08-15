impl Solution {
    pub fn count_homogenous(s: String) -> i32 {
        let modulus = 1_000_000_007i64;
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut res = 1i64;
        let mut cnt = 1;
        for i in 1..n {
            if chars[i] != chars[i - 1] {
                cnt = 0;
            }
            cnt += 1;
            res = (res + cnt as i64) % modulus;
        }
        res as i32
    }
}
