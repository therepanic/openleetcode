impl Solution {
    pub fn kth_largest_value(matrix: Vec<Vec<i32>>, k: i32) -> i32 {
        let n = matrix.len();
        let m = matrix[0].len();
        let mut temp = vec![vec![0; m]; n];
        temp[0][0] = matrix[0][0];
        for j in 1..m {
            temp[0][j] = temp[0][j-1] ^ matrix[0][j];
        }
        for i in 1..n {
            temp[i][0] = temp[i-1][0] ^ matrix[i][0];
        }
        for i in 1..n {
            for j in 1..m {
                temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1];
            }
        }
        let mut arr: Vec<i32> = Vec::new();
        for row in temp.iter() {
            arr.extend(row.iter());
        }
        arr.sort_by(|a, b| b.cmp(a));
        arr[(k-1) as usize]
    }
}
