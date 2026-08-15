impl Solution {
    pub fn find_rotation(mat: Vec<Vec<i32>>, target: Vec<Vec<i32>>) -> bool {
        let mut current = mat;
        for _ in 0..4 {
            if current == target {
                return true;
            }
            current = Self::rotate(current);
        }
        false
    }
    
    fn rotate(mat: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let n = mat.len();
        let mut res = vec![vec![0; n]; n];
        for i in 0..n {
            for j in 0..n {
                res[j][n - 1 - i] = mat[i][j];
            }
        }
        res
    }
}
