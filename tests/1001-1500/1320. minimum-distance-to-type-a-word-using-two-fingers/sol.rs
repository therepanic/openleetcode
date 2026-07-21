impl Solution {
    fn cal(a: i32, b: i32) -> i32 {
        (a / 6 - b / 6).abs() + (a % 6 - b % 6).abs()
    }

    pub fn minimum_distance(word: String) -> i32 {
        let n = word.len();
        let word = word.as_bytes();
        let mut dp = vec![0; 26];
        let mut ndp = vec![0; 26];

        for i in 1..n {
            let p = (word[i - 1] - b'A') as i32;
            let t = (word[i] - b'A') as i32;

            for j in 0..26 {
                ndp[j] = dp[j] + Self::cal(p, t);
            }

            for j in 0..26 {
                ndp[p as usize] = ndp[p as usize].min(dp[j] + Self::cal(j as i32, t));
            }

            std::mem::swap(&mut dp, &mut ndp);
        }

        *dp.iter().min().unwrap()
    }
}
