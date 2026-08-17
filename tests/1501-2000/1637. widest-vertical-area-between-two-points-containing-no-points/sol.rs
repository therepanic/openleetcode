impl Solution {
    pub fn max_width_of_vertical_area(points: Vec<Vec<i32>>) -> i32 {
        let mut points = points;
        points.sort_by_key(|p| p[0]);
        let mut max_width = 0;
        for i in 0..points.len()-1 {
            let width = points[i+1][0] - points[i][0];
            if width > max_width {
                max_width = width;
            }
        }
        max_width
    }
}
