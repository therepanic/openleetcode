impl Solution {
    pub fn find_closest_elements(arr: Vec<i32>, k: i32, x: i32) -> Vec<i32> {
        let mut arr = arr;
        arr.sort_by(|a, b| {
            let da = (a - x).abs();
            let db = (b - x).abs();
            if da != db {
                da.cmp(&db)
            } else {
                a.cmp(b)
            }
        });
        let mut result: Vec<i32> = arr.into_iter().take(k as usize).collect();
        result.sort();
        result
    }
}
