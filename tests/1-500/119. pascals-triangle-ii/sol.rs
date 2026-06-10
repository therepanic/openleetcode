
impl Solution {
    pub fn get_row(row_index: i32) -> Vec<i32> {
        let mut row = vec![1];
        for _ in 0..row_index {
            let mut next = vec![1; row.len() + 1];
            for j in 1..row.len() {
                next[j] = row[j - 1] + row[j];
            }
            row = next;
        }
        row
    }
}
