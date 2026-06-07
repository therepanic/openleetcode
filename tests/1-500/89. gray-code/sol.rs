impl Solution {
    pub fn gray_code(n: i32) -> Vec<i32> {
        let total = 1 << n;
        let mut res = Vec::with_capacity(total as usize);
        for i in 0..total {
            res.push(i ^ (i >> 1));
        }
        res
    }
}
