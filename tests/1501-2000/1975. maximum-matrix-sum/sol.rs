impl Solution {
    pub fn max_matrix_sum(matrix: Vec<Vec<i32>>) -> i64 {
        let mut total_sum: i64 = 0;
        let mut neg = 0;
        let mut min_abs = i32::MAX;
        for row in &matrix {
            for &v in row {
                if v < 0 {
                    neg += 1;
                }
                let av = v.abs();
                total_sum += av as i64;
                min_abs = min_abs.min(av);
            }
        }
        if neg % 2 == 0 {
            total_sum
        } else {
            total_sum - 2 * min_abs as i64
        }
    }
}
