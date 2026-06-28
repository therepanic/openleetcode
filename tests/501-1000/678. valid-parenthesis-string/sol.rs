impl Solution {
    pub fn check_valid_string(s: String) -> bool {
        let mut low = 0i32;
        let mut high = 0i32;
        for c in s.chars() {
            if c == '(' {
                low += 1;
                high += 1;
            } else if c == ')' {
                low = (low - 1).max(0);
                high -= 1;
            } else {
                low = (low - 1).max(0);
                high += 1;
            }
            if high < 0 {
                return false;
            }
        }
        low == 0
    }
}
