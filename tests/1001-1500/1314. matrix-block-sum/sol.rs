impl Solution {
    pub fn matrix_block_sum(mat: Vec<Vec<i32>>, k: i32) -> Vec<Vec<i32>> {
        let n = mat.len();
        let m = mat[0].len();
        let mut pre = vec![vec![0; m]; n];
        let mut ans = vec![vec![0; m]; n];
        let k = k as usize;
        
        for i in 0..n {
            for j in 0..m {
                let mut sum = mat[i][j];
                if i >= 1 { sum += pre[i-1][j]; }
                if j >= 1 { sum += pre[i][j-1]; }
                if i >= 1 && j >= 1 { sum -= pre[i-1][j-1]; }
                pre[i][j] = sum;
            }
        }
        
        for i in 0..n {
            for j in 0..m {
                let i1 = if i < k { 0 } else { i - k };
                let i2 = if i + k >= n { n - 1 } else { i + k };
                let j1 = if j < k { 0 } else { j - k };
                let j2 = if j + k >= m { m - 1 } else { j + k };
                let mut sum = pre[i2][j2];
                if i1 >= 1 { sum -= pre[i1-1][j2]; }
                if j1 >= 1 { sum -= pre[i2][j1-1]; }
                if i1 >= 1 && j1 >= 1 { sum += pre[i1-1][j1-1]; }
                ans[i][j] = sum;
            }
        }
        ans
    }
}
