impl Solution {
    pub fn image_smoother(img: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let m = img.len();
        let n = img[0].len();
        let mut p = vec![vec![0i32; n + 1]; m + 1];
        for i in 1..=m {
            for j in 1..=n {
                p[i][j] = img[i-1][j-1] + p[i-1][j] + p[i][j-1] - p[i-1][j-1];
            }
        }
        let mut res = vec![vec![0i32; n]; m];
        for i in 0..m {
            for j in 0..n {
                let a = if i > 0 { i - 1 } else { 0 };
                let b = if j > 0 { j - 1 } else { 0 };
                let c = if i + 1 < m { i + 1 } else { m - 1 };
                let d = if j + 1 < n { j + 1 } else { n - 1 };
                let s = p[c+1][d+1] - p[a][d+1] - p[c+1][b] + p[a][b];
                res[i][j] = s / ((c - a + 1) * (d - b + 1)) as i32;
            }
        }
        res
    }
}
