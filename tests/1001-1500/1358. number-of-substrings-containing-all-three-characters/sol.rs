impl Solution {
    pub fn number_of_substrings(s: String) -> i32 {
        let mut res = 0;
        let mut p = [50000i32, -1, -1, -1];
        for (i, ch) in s.bytes().enumerate() {
            p[(ch & 31) as usize] = i as i32;
            res += p[1].min(p[2]).min(p[3]) + 1;
        }
        res
    }
}
