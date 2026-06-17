impl Solution {
    pub fn search_matrix(matrix: Vec<Vec<i32>>, target: i32) -> bool {
        let mut v = false;
        for i in &matrix {
            for j in 0..i.len() {
                if i[j] == target {
                    v = true;
                }
            }
        }
        v
    }
}
