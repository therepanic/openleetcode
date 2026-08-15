impl Solution {
    pub fn nearest_valid_point(x: i32, y: i32, points: Vec<Vec<i32>>) -> i32 {
        let mut current_min_distance = 20001;
        let mut current_min_index = -1;
        for (i, point) in points.iter().enumerate() {
            let a = point[0];
            let b = point[1];
            if x == a || y == b {
                let distance = (x - a).abs() + (y - b).abs();
                if distance < current_min_distance {
                    current_min_distance = distance;
                    current_min_index = i as i32;
                }
            }
        }
        current_min_index
    }
}
