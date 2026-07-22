impl Solution {
    pub fn find_diagonal_order(nums: Vec<Vec<i32>>) -> Vec<i32> {
        use std::collections::BTreeMap;

        let mut l: Vec<(usize, usize, usize)> = Vec::new();
        for i in 0..nums.len() {
            for j in 0..nums[i].len() {
                l.push((i + j, i, j));
            }
        }

        let mut h: BTreeMap<usize, Vec<i32>> = BTreeMap::new();
        for (sum, i, j) in l {
            h.entry(sum).or_default().push(nums[i][j]);
        }

        let mut result = Vec::new();
        for (_key, diag) in h.iter() {
            for &val in diag.iter().rev() {
                result.push(val);
            }
        }
        result
    }
}
