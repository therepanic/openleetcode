impl Solution {
    pub fn k_closest(mut points: Vec<Vec<i32>>, k: i32) -> Vec<Vec<i32>> {
        points.sort_by_key(|p| p[0] as i64 * p[0] as i64 + p[1] as i64 * p[1] as i64);
        points.into_iter().take(k as usize).collect()
    }
}
