impl Solution {
    pub fn has_all_codes(s: String, k: i32) -> bool {
        let k = k as usize;
        let req = 1 << k;
        let mut seen = vec![false; req];
        let mask = req - 1;
        let mut h = 0;
        let mut remaining = req;

        for (i, ch) in s.chars().enumerate() {
            h = ((h << 1) & mask) | ((ch as usize) & 1);

            if i >= k - 1 && !seen[h] {
                seen[h] = true;
                remaining -= 1;
                if remaining == 0 {
                    return true;
                }
            }
        }

        false
    }
}
