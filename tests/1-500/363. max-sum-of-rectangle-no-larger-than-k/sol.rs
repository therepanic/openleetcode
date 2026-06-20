impl Solution {
    pub fn max_sum_submatrix(matrix: Vec<Vec<i32>>, k: i32) -> i32 {
        let m = matrix.len();
        let n = matrix[0].len();
        let mut ans = i32::MIN;
        for left in 0..n {
            let mut row_sum = vec![0; m];
            for right in left..n {
                for i in 0..m {
                    row_sum[i] += matrix[i][right];
                }
                let mut s: Vec<i32> = vec![0];
                let mut curr = 0;
                for &x in &row_sum {
                    curr += x;
                    let target = curr - k;
                    let idx = match s.binary_search(&target) {
                        Ok(i) => i,
                        Err(i) => i,
                    };
                    if idx < s.len() {
                        ans = ans.max(curr - s[idx]);
                    }
                    let idx_insert = match s.binary_search(&curr) {
                        Ok(i) => i,
                        Err(i) => i,
                    };
                    s.insert(idx_insert, curr);
                }
            }
        }
        ans
    }
}
