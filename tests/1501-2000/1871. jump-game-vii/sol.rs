impl Solution {
    pub fn can_reach(s: String, min_jump: i32, max_jump: i32) -> bool {
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        if chars[n-1] == '1' {
            return false;
        }

        let mut dp = vec![false; n];
        dp[0] = true;

        let mut reachable = 0;

        for i in 1..n {
            if i >= min_jump as usize && dp[i - min_jump as usize] {
                reachable += 1;
            }

            if i > max_jump as usize && dp[i - max_jump as usize - 1] {
                reachable -= 1;
            }

            if reachable > 0 && chars[i] == '0' {
                dp[i] = true;
            }
        }

        dp[n-1]
    }
}
