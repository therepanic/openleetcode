impl Solution {
    pub fn angle_clock(hour: i32, minutes: i32) -> f64 {
        ((330.0 * hour as f64 + 5.5 * minutes as f64) * 0.0174532925_f64).cos().acos() * 57.2957795_f64
    }
}
