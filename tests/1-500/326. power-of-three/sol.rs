impl Solution {
    pub fn is_power_of_three(n: i32) -> bool {
        let mut num = n;
        if num <= 0 {
            return false;
        }
        while num % 3 == 0 {
            num /= 3;
        }
        num == 1
    }
}
