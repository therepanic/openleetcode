impl Solution {
    pub fn min_characters(a: String, b: String) -> i32 {
        let mut freq_a = vec![0; 26];
        let mut freq_b = vec![0; 26];

        for ch in a.bytes() {
            freq_a[(ch - b'a') as usize] += 1;
        }
        for ch in b.bytes() {
            freq_b[(ch - b'a') as usize] += 1;
        }

        let len_a = a.len();
        let len_b = b.len();
        let mut res = i32::MAX;
        let mut sum_a = 0;
        let mut sum_b = 0;

        for i in 0..25 {
            sum_a += freq_a[i];
            sum_b += freq_b[i];
            res = res.min((len_a as i32 - sum_a + sum_b));
            res = res.min((len_b as i32 - sum_b + sum_a));
        }

        for i in 0..26 {
            res = res.min((len_a as i32 - freq_a[i]) + (len_b as i32 - freq_b[i]));
        }

        res
    }
}
