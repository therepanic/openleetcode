impl Solution {
    pub fn path_in_zig_zag_tree(label: i32) -> Vec<i32> {
        let mut res = Vec::new();
        let mut cur = label;
        while cur > 0 {
            res.push(cur);
            let mut start = 1;
            while start * 2 <= cur {
                start *= 2;
            }
            let end = start * 2 - 1;
            cur = (start + end - cur) / 2;
        }
        res.reverse();
        res
    }
}
