impl Solution {
    pub fn get_last_moment(n: i32, left: Vec<i32>, right: Vec<i32>) -> i32 {
        let mut max_val = 0;
        for value in left {
            max_val = max_val.max(value);
        }
        for value in right {
            max_val = max_val.max(n - value);
        }
        max_val
    }
}
