
impl Solution {
    pub fn generate(num_rows: i32) -> Vec<Vec<i32>> {
        let mut result: Vec<Vec<i32>> = Vec::new();
        for i in 0..num_rows as usize {
            let mut row = vec![1; i + 1];
            for j in 1..i {
                row[j] = result[i - 1][j - 1] + result[i - 1][j];
            }
            result.push(row);
        }
        result
    }
}
