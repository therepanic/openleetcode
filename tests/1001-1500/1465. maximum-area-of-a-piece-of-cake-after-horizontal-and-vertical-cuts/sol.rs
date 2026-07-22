impl Solution {
    pub fn max_area(h: i32, w: i32, mut horizontal_cuts: Vec<i32>, mut vertical_cuts: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        
        horizontal_cuts.sort();
        vertical_cuts.sort();
        
        let mut max_h = std::cmp::max(horizontal_cuts[0] as i64, (h - horizontal_cuts[horizontal_cuts.len() - 1]) as i64);
        for i in 1..horizontal_cuts.len() {
            max_h = std::cmp::max(max_h, (horizontal_cuts[i] - horizontal_cuts[i - 1]) as i64);
        }
        
        let mut max_v = std::cmp::max(vertical_cuts[0] as i64, (w - vertical_cuts[vertical_cuts.len() - 1]) as i64);
        for i in 1..vertical_cuts.len() {
            max_v = std::cmp::max(max_v, (vertical_cuts[i] - vertical_cuts[i - 1]) as i64);
        }
        
        ((max_h * max_v) % MOD) as i32
    }
}
