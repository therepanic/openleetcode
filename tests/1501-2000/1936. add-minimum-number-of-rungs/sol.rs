impl Solution {
    pub fn add_rungs(rungs: Vec<i32>, dist: i32) -> i32 {
        let mut curr = 0;
        let mut res = 0;
        for rung in rungs {
            if rung - curr > dist {
                res += (rung - curr - 1) / dist;
            }
            curr = rung;
        }
        res
    }
}
