impl Solution {
    pub fn subsets(nums: Vec<i32>) -> Vec<Vec<i32>> {
        let mut res = vec![vec![]];
        for x in nums {
            let mut add = Vec::new();
            for cur in &res {
                let mut next = cur.clone();
                next.push(x);
                add.push(next);
            }
            res.extend(add);
        }
        res
    }
}
