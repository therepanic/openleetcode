impl Solution {
    pub fn count_binary_substrings(s: String) -> i32 {
        let mut ans = 0i32;
        let mut prev = 0i32;
        let mut cur = 1i32;
        let bytes = s.as_bytes();
        for i in 1..bytes.len() {
            if bytes[i-1] != bytes[i] {
                ans += std::cmp::min(prev, cur);
                prev = cur;
                cur = 1;
            } else {
                cur += 1;
            }
        }
        ans + std::cmp::min(prev, cur)
    }
}
