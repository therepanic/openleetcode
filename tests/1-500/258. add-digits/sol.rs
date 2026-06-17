impl Solution {
    pub fn add_digits(num: i32) -> i32 {
        if num == 0 {
            return 0;
        }
        if num % 9 == 0 {
            return 9;
        } else {
            return num % 9;
        }
    }
}
