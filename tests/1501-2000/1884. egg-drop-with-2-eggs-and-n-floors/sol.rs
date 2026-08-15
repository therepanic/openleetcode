impl Solution {
    pub fn two_egg_drop(n: i32) -> i32 {
        let mut l = 1;
        let mut r = n;
        let mut res = 0;
        while l <= r {
            let moves = (l + r) / 2;
            if ((1 + moves) * moves / 2) >= n {
                res = moves;
                r = moves - 1;
            } else {
                l = moves + 1;
            }
        }
        res
    }
}
