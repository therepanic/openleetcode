impl Solution {
    pub fn nth_ugly_number(n: i32) -> i32 {
        let n = n as usize;
        let mut h = vec![0; n];
        h[0] = 1;
        let (mut i, mut j, mut k) = (0, 0, 0);

        for idx in 1..n {
            let m = (h[i] * 2).min(h[j] * 3).min(h[k] * 5);
            h[idx] = m;

            if m == h[i] * 2 { i += 1; }
            if m == h[j] * 3 { j += 1; }
            if m == h[k] * 5 { k += 1; }
        }

        h[n - 1]
    }
}
