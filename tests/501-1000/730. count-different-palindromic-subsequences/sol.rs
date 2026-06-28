impl Solution {
    pub fn count_palindromic_subsequences(s: String) -> i32 {
        const MOD: i64 = 1000000007;
        let s = s.as_bytes();
        let n = s.len();
        let mut memo = vec![vec![-1; n + 1]; n + 1];
        
        fn dp(left: usize, right: usize, s: &[u8], memo: &mut Vec<Vec<i64>>) -> i64 {
            if left >= right {
                return 0;
            }
            if memo[left][right] != -1 {
                return memo[left][right];
            }
            let mut res: i64 = 0;
            for &ch in b"abcd" {
                let l = s[left..right].iter().position(|&c| c == ch).map(|p| left + p);
                if let Some(l) = l {
                    let r = s[left..right].iter().rposition(|&c| c == ch).map(|p| left + p);
                    if let Some(r) = r {
                        if l == r {
                            res += 1;
                        } else {
                            res += dp(l + 1, r, s, memo) + 2;
                        }
                    }
                }
            }
            res %= MOD;
            memo[left][right] = res;
            res
        }
        
        dp(0, n, s, &mut memo) as i32
    }
}
