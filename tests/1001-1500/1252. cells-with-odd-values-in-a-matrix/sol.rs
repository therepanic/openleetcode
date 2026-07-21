impl Solution {
    pub fn odd_cells(m: i32, n: i32, indices: Vec<Vec<i32>>) -> i32 {
        let m = m as usize;
        let n = n as usize;
        let mut a = vec![vec![0; n]; m];
        let mut c = 0;
        for k in &indices {
            for u in 0..n {
                a[k[0] as usize][u] += 1;
            }
            for l in 0..m {
                a[l][k[1] as usize] += 1;
            }
        }
        for i in 0..m {
            for j in 0..n {
                if a[i][j] % 2 != 0 {
                    c += 1;
                }
            }
        }
        c
    }
}
