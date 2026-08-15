impl Solution {
    pub fn count_points(points: Vec<Vec<i32>>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let mut result = vec![0; queries.len()];
        for i in 0..queries.len() {
            for j in 0..points.len() {
                let dx = queries[i][0] - points[j][0];
                let dy = queries[i][1] - points[j][1];
                if dx * dx + dy * dy <= queries[i][2] * queries[i][2] {
                    result[i] += 1;
                }
            }
        }
        result
    }
}
