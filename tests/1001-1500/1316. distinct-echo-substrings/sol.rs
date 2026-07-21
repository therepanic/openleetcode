impl Solution {
    pub fn distinct_echo_substrings(text: String) -> i32 {
        let n = text.len();
        let b1: i64 = 911382323;
        let b2: i64 = 972663749;
        let m1: i64 = 1000000007;
        let m2: i64 = 1000000009;
        let mut p1 = vec![1i64; n + 1];
        let mut p2 = vec![1i64; n + 1];
        let mut h1 = vec![0i64; n + 1];
        let mut h2 = vec![0i64; n + 1];
        let a = 'a' as i64;
        let bytes = text.as_bytes();
        for i in 1..=n {
            let v = bytes[i - 1] as i64 - a;
            p1[i] = (p1[i - 1] * b1) % m1;
            p2[i] = (p2[i - 1] * b2) % m2;
            h1[i] = (h1[i - 1] * b1 + v) % m1;
            h2[i] = (h2[i - 1] * b2 + v) % m2;
        }
        let get = |l: usize, r: usize| -> (i64, i64) {
            let v1 = (h1[r] - h1[l] * p1[r - l]) % m1;
            let v2 = (h2[r] - h2[l] * p2[r - l]) % m2;
            (if v1 < 0 { v1 + m1 } else { v1 }, if v2 < 0 { v2 + m2 } else { v2 })
        };
        let mut st = std::collections::HashSet::new();
        for i in 0..n {
            let max_len = (n - i) / 2;
            for l in 1..=max_len {
                if get(i, i + l) == get(i + l, i + 2 * l) {
                    let h = get(i, i + 2 * l);
                    st.insert((2 * l, h));
                }
            }
        }
        st.len() as i32
    }
}
