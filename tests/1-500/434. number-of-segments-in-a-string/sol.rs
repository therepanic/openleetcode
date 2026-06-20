impl Solution {
    pub fn count_segments(s: String) -> i32 {
        let mut c = 0;
        let bytes = s.as_bytes();
        for i in 0..bytes.len() {
            if bytes[i] != b' ' && (i == 0 || bytes[i - 1] == b' ') {
                c += 1;
            }
        }
        c
    }
}
