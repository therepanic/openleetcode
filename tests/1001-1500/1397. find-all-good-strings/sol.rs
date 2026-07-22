impl Solution {
    pub fn find_good_strings(n: i32, s1: String, s2: String, evil: String) -> i32 {
        const MOD: i32 = 1_000_000_007;
        let n = n as usize;
        let m = evil.len();
        let s1: Vec<char> = s1.chars().collect();
        let s2: Vec<char> = s2.chars().collect();
        let evil: Vec<char> = evil.chars().collect();
        
        let mut lps = vec![0; m];
        for i in 1..m {
            let mut j = lps[i - 1];
            while j > 0 && evil[i] != evil[j] {
                j = lps[j - 1];
            }
            if evil[i] == evil[j] {
                lps[i] = j + 1;
            }
        }
        
        let get_next_state = |curr_match: usize, c: char| -> usize {
            let mut curr = curr_match;
            while curr > 0 && c != evil[curr] {
                curr = lps[curr - 1];
            }
            if c == evil[curr] {
                curr += 1;
            }
            curr
        };
        
        let mut memo = vec![vec![vec![vec![-1i32; 2]; 2]; m + 1]; n + 1];
        
        fn dp(
            idx: usize,
            e_idx: usize,
            tight_lo: usize,
            tight_hi: usize,
            n: usize,
            m: usize,
            s1: &[char],
            s2: &[char],
            evil: &[char],
            lps: &[usize],
            get_next_state: &impl Fn(usize, char) -> usize,
            memo: &mut Vec<Vec<Vec<Vec<i32>>>>,
        ) -> i32 {
            if e_idx == m {
                return 0;
            }
            if idx == n {
                return 1;
            }
            
            if memo[idx][e_idx][tight_lo][tight_hi] != -1 {
                return memo[idx][e_idx][tight_lo][tight_hi];
            }
            
            let mut res = 0;
            let lower = if tight_lo == 1 { s1[idx] } else { 'a' };
            let upper = if tight_hi == 1 { s2[idx] } else { 'z' };
            
            let mut c = lower;
            while c as u8 <= upper as u8 {
                let next_e_idx = get_next_state(e_idx, c);
                let next_tight_lo = if tight_lo == 1 && c == lower { 1 } else { 0 };
                let next_tight_hi = if tight_hi == 1 && c == upper { 1 } else { 0 };
                
                res = (res + dp(
                    idx + 1,
                    next_e_idx,
                    next_tight_lo,
                    next_tight_hi,
                    n,
                    m,
                    s1,
                    s2,
                    evil,
                    lps,
                    get_next_state,
                    memo,
                )) % MOD;
                
                c = ((c as u8) + 1) as char;
            }
            
            memo[idx][e_idx][tight_lo][tight_hi] = res;
            res
        }
        
        dp(0, 0, 1, 1, n, m, &s1, &s2, &evil, &lps, &get_next_state, &mut memo)
    }
}
