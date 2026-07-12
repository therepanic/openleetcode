impl Solution {
    pub fn all_cells_dist_order(rows: i32, cols: i32, r_center: i32, c_center: i32) -> Vec<Vec<i32>> {
        let mut result = Vec::new();
        for r in 0..rows {
            for c in 0..cols {
                result.push(vec![r, c]);
            }
        }
        result.sort_by_key(|p| ((p[0] - r_center).abs() + (p[1] - c_center).abs(), p[0], p[1]));
        result
    }
}
