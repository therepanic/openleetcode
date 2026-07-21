impl Solution {
    pub fn k_weakest_rows(mat: Vec<Vec<i32>>, k: i32) -> Vec<i32> {
        let mut pairs: Vec<(i32, usize)> = mat
            .iter()
            .enumerate()
            .map(|(i, row)| (row.iter().sum(), i))
            .collect();
        pairs.sort_by(|a, b| a.0.cmp(&b.0).then(a.1.cmp(&b.1)));
        pairs.iter().take(k as usize).map(|&(_, i)| i as i32).collect()
    }
}
