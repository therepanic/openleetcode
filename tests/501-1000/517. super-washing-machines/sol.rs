impl Solution {
    pub fn find_min_moves(machines: Vec<i32>) -> i32 {
        let n = machines.len();
        let total: i32 = machines.iter().sum();
        if total % (n as i32) != 0 {
            return -1;
        }
        let avg = total / (n as i32);
        let imbalances: Vec<i32> = machines.iter().map(|&m| m - avg).collect();
        let mut res = 0;
        let mut d: i32 = 0;
        for imb in imbalances {
            res = res.max(d.abs());
            res = res.max(imb);
            d += imb;
        }
        res
    }
}
