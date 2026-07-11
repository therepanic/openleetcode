impl Solution {
    pub fn max_depth_after_split(seq: String) -> Vec<i32> {
        let mut res = Vec::new();
        let mut depth = 0;
        for ch in seq.chars() {
            if ch == '(' {
                depth += 1;
                res.push(depth % 2);
            } else {
                res.push(depth % 2);
                depth -= 1;
            }
        }
        res
    }
}
