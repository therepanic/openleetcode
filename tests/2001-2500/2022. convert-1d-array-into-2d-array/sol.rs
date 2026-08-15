impl Solution {
    pub fn construct2_d_array(original: Vec<i32>, m: i32, n: i32) -> Vec<Vec<i32>> {
        let k = original.len() as i32;
        if m * n != k {
            return Vec::new();
        }
        let mut ans = vec![vec![0; n as usize]; m as usize];
        let mut idx = 0;
        for i in 0..m as usize {
            for j in 0..n as usize {
                ans[i][j] = original[idx];
                idx += 1;
            }
        }
        ans
    }
}
