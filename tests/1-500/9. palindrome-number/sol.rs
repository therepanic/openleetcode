impl Solution {
    pub fn is_palindrome(x: i32) -> bool {
        if x < 0 {
            return false;
        }

        let mut rev: i64 = 0;
        let mut num = x;
        while num != 0 {
            rev = rev * 10 + i64::from(num % 10);
            num /= 10;
        }
        rev == x as i64
    }
}
