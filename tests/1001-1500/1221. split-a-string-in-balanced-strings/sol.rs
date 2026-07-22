impl Solution {
    pub fn balanced_string_split(s: String) -> i32 {
        let mut bal = 0;
        let mut count = 0;
        for c in s.chars() {
            if c == 'L' {
                bal += 1;
            } else if c == 'R' {
                bal -= 1;
            }
            if bal == 0 {
                count += 1;
            }
        }
        count
    }
}
