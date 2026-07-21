impl Solution {
    pub fn minimum_swap(s1: String, s2: String) -> i32 {
        let n = s1.len();
        let mut s1_x = 0;
        let mut s1_y = 0;
        let s1_bytes = s1.as_bytes();
        let s2_bytes = s2.as_bytes();
        for i in 0..n {
            if s1_bytes[i] == s2_bytes[i] {
                continue;
            }
            if s1_bytes[i] == b'x' {
                s1_x += 1;
            } else {
                s1_y += 1;
            }
        }

        if s1_x % 2 != s1_y % 2 {
            return -1;
        }

        let swaps = s1_x / 2 + s1_y / 2;
        if s1_x % 2 == 0 {
            swaps
        } else {
            swaps + 2
        }
    }
}
