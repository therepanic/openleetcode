impl Solution {
    pub fn check_perfect_number(num: i32) -> bool {
        if num == 1 {
            return false;
        }
        let mut count = 1;
        let mut i = 2;
        while i * i <= num {
            if num % i == 0 {
                count += i + num / i;
            }
            i += 1;
        }
        num == count
    }
}
