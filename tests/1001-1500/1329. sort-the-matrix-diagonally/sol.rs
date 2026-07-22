use std::collections::HashMap;

impl Solution {
    pub fn diagonal_sort(mat: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut mat = mat;
        let m = mat.len();
        let n = mat[0].len();
        let mut diagonals: HashMap<i32, Vec<i32>> = HashMap::new();
        
        for i in 0..m {
            for j in 0..n {
                let key = i as i32 - j as i32;
                diagonals.entry(key).or_insert_with(Vec::new).push(mat[i][j]);
            }
        }
        
        for list in diagonals.values_mut() {
            list.sort_by(|a, b| b.cmp(a));
        }
        
        for i in 0..m {
            for j in 0..n {
                let key = i as i32 - j as i32;
                mat[i][j] = diagonals.get_mut(&key).unwrap().pop().unwrap();
            }
        }
        
        mat
    }
}
