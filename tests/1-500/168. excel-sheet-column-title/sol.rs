impl Solution {
    pub fn convert_to_title(mut column_number: i32) -> String {
        let mut chars = Vec::new();
        while column_number > 0 {
            column_number -= 1;
            chars.push((b'A' + (column_number % 26) as u8) as char);
            column_number /= 26;
        }
        chars.iter().rev().collect()
    }
}
