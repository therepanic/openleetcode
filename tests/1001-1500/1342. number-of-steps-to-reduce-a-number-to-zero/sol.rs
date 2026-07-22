impl Solution {
    pub fn number_of_steps(num: i32) -> i32 {
        if num == 0 {
            return 0;
        }
        (32 - num.leading_zeros() as i32) - 1 + num.count_ones() as i32
    }
}
