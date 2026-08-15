impl Solution {
    pub fn num_special(mat: Vec<Vec<i32>>) -> i32 {
        let m = mat.len();
        let n = mat[0].len();
        let mut row = vec![0; m];
        let mut col = vec![0; n];

        for i in 0..m {
            for j in 0..n {
                if mat[i][j] == 1 {
                    row[i] += 1;
                    col[j] += 1;
                }
            }
        }

        let mut result = 0;
        for i in 0..m {
            for j in 0..n {
                if mat[i][j] == 1 && row[i] == 1 && col[j] == 1 {
                    result += 1;
                }
            }
        }
        result
    }
}
