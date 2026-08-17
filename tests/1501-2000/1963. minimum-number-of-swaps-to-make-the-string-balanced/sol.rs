impl Solution {
    pub fn min_swaps(s: String) -> i32 {
        let mut swap = 0;
        for c in s.chars() {
            if c == '[' {
                swap += 1;
            } else {
                if swap > 0 {
                    swap -= 1;
                }
            }
        }
        (swap + 1) / 2
    }
}
