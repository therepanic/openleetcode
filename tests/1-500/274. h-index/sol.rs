impl Solution {
    pub fn h_index(citations: Vec<i32>) -> i32 {
        let mut sorted = citations;
        sorted.sort_by(|a, b| b.cmp(a));
        let mut count = 0;
        for i in 0..sorted.len() {
            if sorted[i] >= (i + 1) as i32 {
                count = (i + 1) as i32;
            } else {
                break;
            }
        }
        count
    }
}
