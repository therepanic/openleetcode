impl Solution {
    pub fn di_string_match(s: String) -> Vec<i32> {
        let mut low = 0i32;
        let mut high = s.len() as i32;
        let mut result = vec![0; s.len() + 1];
        for (i, c) in s.chars().enumerate() {
            if c == 'I' {
                result[i] = low;
                low += 1;
            } else {
                result[i] = high;
                high -= 1;
            }
        }
        result[s.len()] = low;
        result
    }
}
