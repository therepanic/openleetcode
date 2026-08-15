impl Solution {
    pub fn max_depth(s: String) -> i32 {
        let mut ctr = 0i32;
        let mut ans = 0i32;
        for ch in s.chars() {
            if ch == '(' {
                ctr += 1;
                ans = ans.max(ctr);
            } else if ch == ')' {
                ctr -= 1;
            }
        }
        ans
    }
}
