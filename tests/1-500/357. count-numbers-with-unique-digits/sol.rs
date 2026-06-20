impl Solution {
    pub fn count_numbers_with_unique_digits(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        if n == 1 {
            return 10;
        }
        let mut result = 10;
        let mut current = 9;
        for i in 2..=n {
            current *= 10 - (i - 1);
            result += current;
        }
        result
    }
}
