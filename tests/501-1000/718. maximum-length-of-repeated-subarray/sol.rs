impl Solution {
    pub fn find_length(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        const P: i64 = 113;
        const MOD: i64 = 1_000_000_007;
        let pinv = Self::mod_pow(P, MOD - 2, MOD);

        fn check(nums1: &[i32], nums2: &[i32], guess: usize, p: i64, mod_val: i64, pinv: i64) -> bool {
            if guess == 0 {
                return true;
            }

            use std::collections::HashMap;

            let mut hashes: HashMap<i64, Vec<usize>> = HashMap::new();

            // nums1
            let mut h: i64 = 0;
            let mut power: i64 = 1;
            for i in 0..nums1.len() {
                h = (h + nums1[i] as i64 * power) % mod_val;
                if i < guess - 1 {
                    power = (power * p) % mod_val;
                } else {
                    let start = i - (guess - 1);
                    hashes.entry(h).or_insert(Vec::new()).push(start);
                    h = (h - nums1[start] as i64 + mod_val) * pinv % mod_val;
                }
            }

            // nums2
            h = 0;
            power = 1;
            for i in 0..nums2.len() {
                h = (h + nums2[i] as i64 * power) % mod_val;
                if i < guess - 1 {
                    power = (power * p) % mod_val;
                } else {
                    let start = i - (guess - 1);
                    if let Some(indices) = hashes.get(&h) {
                        for &idx in indices {
                            if nums1[idx..idx + guess] == nums2[start..start + guess] {
                                return true;
                            }
                        }
                    }
                    h = (h - nums2[start] as i64 + mod_val) * pinv % mod_val;
                }
            }
            false
        }

        let mut lo: i32 = 0;
        let mut hi: i32 = nums1.len().min(nums2.len()) as i32 + 1;
        while lo < hi {
            let mi = (lo + hi) / 2;
            if check(&nums1, &nums2, mi as usize, P, MOD, pinv) {
                lo = mi + 1;
            } else {
                hi = mi;
            }
        }
        lo - 1
    }

    fn mod_pow(mut base: i64, mut exp: i64, mod_val: i64) -> i64 {
        let mut result = 1;
        base %= mod_val;
        while exp > 0 {
            if exp & 1 == 1 {
                result = (result * base) % mod_val;
            }
            base = (base * base) % mod_val;
            exp >>= 1;
        }
        result
    }
}
