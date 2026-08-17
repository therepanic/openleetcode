impl Solution {
    pub fn largest_submatrix(matrix: Vec<Vec<i32>>) -> i32 {
        let m = matrix.len();
        let n = matrix[0].len();
        let mut max_area = 0;
        let mut h = vec![0; n];
        for i in 0..m {
            for j in 0..n {
                if j < matrix[i].len() && matrix[i][j] == 1 {
                    h[j] += 1;
                } else {
                    h[j] = 0;
                }
            }
            let mut sh = h.clone();
            sh.sort_by(|a, b| b.cmp(a));
            for j in 0..n {
                if sh[j] == 0 {
                    break;
                }
                max_area = max_area.max(sh[j] * (j as i32 + 1));
            }
        }
        max_area
    }
}
