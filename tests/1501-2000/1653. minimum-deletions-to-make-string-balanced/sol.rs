impl Solution {
    pub fn minimum_deletions(s: String) -> i32 {
        let mut res = 0;
        let mut count = 0;
        for ch in s.chars() {
            if ch == 'b' {
                count += 1;
            } else if count > 0 {
                res += 1;
                count -= 1;
            }
        }
        res
    }
}
