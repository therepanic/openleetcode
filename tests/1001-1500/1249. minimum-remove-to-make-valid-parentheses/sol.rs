impl Solution {
    pub fn min_remove_to_make_valid(s: String) -> String {
        let mut t: Vec<char> = Vec::new();
        let mut p: i32 = 0;
        for c in s.chars() {
            if c == '(' {
                p += 1;
            } else if c == ')' {
                p -= 1;
            }
            if p >= 0 {
                t.push(c);
            } else {
                p = 0;
            }
        }
        p = 0;
        let mut result: Vec<char> = Vec::new();
        for c in t.iter().rev() {
            let c = *c;
            if c == '(' {
                p += 1;
            } else if c == ')' {
                p -= 1;
            }
            if p <= 0 {
                result.push(c);
            } else {
                p = 0;
            }
        }
        result.reverse();
        result.iter().collect()
    }
}
