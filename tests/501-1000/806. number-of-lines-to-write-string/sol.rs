impl Solution {
    pub fn number_of_lines(widths: Vec<i32>, s: String) -> Vec<i32> {
        let mut lines = 1;
        let mut current = 0;
        for c in s.chars() {
            let w = widths[(c as u8 - b'a') as usize];
            if current + w > 100 {
                lines += 1;
                current = w;
            } else {
                current += w;
            }
        }
        vec![lines, current]
    }
}
