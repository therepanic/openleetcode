impl Solution {
    pub fn restore_string(s: String, indices: Vec<i32>) -> String {
        let mut res = vec![' '; indices.len()];
        for (i, &idx) in indices.iter().enumerate() {
            let c = s.chars().nth(i).unwrap();
            res[idx as usize] = c;
        }
        res.into_iter().collect()
    }
}
