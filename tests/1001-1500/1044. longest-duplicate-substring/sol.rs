impl Solution {
    pub fn longest_dup_substring(s: String) -> String {
        let n = s.len();
        let base1: i64 = 131;
        let base2: i64 = 31;
        let mod1: i64 = 1000000005;
        let mod2: i64 = 1000000007;
        let bytes = s.as_bytes();

        let mut h1 = vec![0i64; n + 1];
        let mut p1 = vec![1i64; n + 1];
        let mut h2 = vec![0i64; n + 1];
        let mut p2 = vec![1i64; n + 1];

        for i in 0..n {
            h1[i + 1] = (h1[i] * base1 + bytes[i] as i64) % mod1;
            p1[i + 1] = (p1[i] * base1) % mod1;
            h2[i + 1] = (h2[i] * base2 + bytes[i] as i64) % mod2;
            p2[i + 1] = (p2[i] * base2) % mod2;
        }

        let check = |len: usize| -> Option<&str> {
            use std::collections::HashSet;
            let mut seen = HashSet::new();
            for i in 0..=n - len {
                let mut v1 = (h1[i + len] - h1[i] * p1[len]) % mod1;
                if v1 < 0 { v1 += mod1; }
                let mut v2 = (h2[i + len] - h2[i] * p2[len]) % mod2;
                if v2 < 0 { v2 += mod2; }
                let key = (v1 as u64) << 32 | (v2 as u64);
                if !seen.insert(key) {
                    return Some(&s[i..i + len]);
                }
            }
            None
        };

        let (mut lo, mut hi, mut res) = (1usize, n, "");
        while lo <= hi {
            let mid = (lo + hi) / 2;
            if let Some(t) = check(mid) {
                res = t;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        res.to_string()
    }
}
