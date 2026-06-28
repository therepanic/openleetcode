impl Solution {
    pub fn judge_circle(moves: String) -> bool {
        let mut count_l = 0;
        let mut count_r = 0;
        let mut count_u = 0;
        let mut count_d = 0;
        for c in moves.chars() {
            match c {
                'L' => count_l += 1,
                'R' => count_r += 1,
                'U' => count_u += 1,
                'D' => count_d += 1,
                _ => {}
            }
        }
        count_l == count_r && count_u == count_d
    }
}
