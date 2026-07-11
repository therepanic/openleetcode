impl Solution {
    pub fn height_checker(heights: Vec<i32>) -> i32 {
        let mut count = 0;
        let mut s = heights.clone();
        s.sort();
        for i in 0..heights.len() {
            if heights[i] != s[i] {
                count += 1;
            }
        }
        count
    }
}
