impl Solution {
    pub fn square_is_white(coordinates: String) -> bool {
        let bytes = coordinates.as_bytes();
        (bytes[0] as i32 - bytes[1] as i32) % 2 != 0
    }
}
