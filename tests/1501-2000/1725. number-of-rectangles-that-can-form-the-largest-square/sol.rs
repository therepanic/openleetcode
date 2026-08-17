impl Solution {
    pub fn count_good_rectangles(rectangles: Vec<Vec<i32>>) -> i32 {
        let max_len = rectangles.iter().map(|r| r.iter().min().unwrap()).max().unwrap();
        rectangles.iter().filter(|r| r.iter().min().unwrap() == max_len).count() as i32
    }
}
