impl Solution {
    pub fn check_overlap(radius: i32, x_center: i32, y_center: i32, x1: i32, y1: i32, x2: i32, y2: i32) -> bool {
        let nearest_x = x1.max(x2.min(x_center));
        let nearest_y = y1.max(y2.min(y_center));
        let dist = (nearest_x - x_center).pow(2) + (nearest_y - y_center).pow(2);
        dist <= radius * radius
    }
}
