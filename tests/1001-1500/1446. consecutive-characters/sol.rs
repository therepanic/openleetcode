impl Solution {
    pub fn max_power(s: String) -> i32 {
        let mut maxcnt = 0;
        let mut cnt = 0;
        let bytes = s.as_bytes();
        for i in 1..bytes.len() {
            if bytes[i] == bytes[i - 1] {
                cnt += 1;
            } else {
                cnt = 0;
            }
            maxcnt = maxcnt.max(cnt);
        }
        maxcnt + 1
    }
}
