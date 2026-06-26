impl Solution {
    pub fn max_count(m: i32, n: i32, ops: Vec<Vec<i32>>) -> i32 {
        if ops.is_empty() {
            return m * n;
        }
        let mut min_m = m;
        let mut min_n = n;
        for op in &ops {
            min_m = min_m.min(op[0]);
            min_n = min_n.min(op[1]);
        }
        min_m * min_n
    }
}
