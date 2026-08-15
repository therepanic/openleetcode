impl Solution {
    pub fn check_powers_of_three(n: i32) -> bool {
        let mut num = n;
        while num > 0 {
            if num % 3 == 2 {
                return false;
            }
            num /= 3;
        }
        true
    }
}
