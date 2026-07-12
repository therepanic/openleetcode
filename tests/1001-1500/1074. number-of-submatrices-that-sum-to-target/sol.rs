impl Solution {
    pub fn num_submatrix_sum_target(matrix: Vec<Vec<i32>>, target: i32) -> i32 {
        let mut matrix = matrix;
        let m = matrix.len();
        let n = matrix[0].len();
        for row in 0..m {
            for col in 1..n {
                matrix[row][col] += matrix[row][col - 1];
            }
        }
        let mut count = 0;
        for c1 in 0..n {
            for c2 in c1..n {
                let mut prefix_sum_map = std::collections::HashMap::new();
                prefix_sum_map.insert(0, 1);
                let mut sum_val = 0;
                for row in 0..m {
                    let sub = if c1 > 0 { matrix[row][c1 - 1] } else { 0 };
                    sum_val += matrix[row][c2] - sub;
                    count += prefix_sum_map.get(&(sum_val - target)).unwrap_or(&0);
                    *prefix_sum_map.entry(sum_val).or_insert(0) += 1;
                }
            }
        }
        count
    }
}
