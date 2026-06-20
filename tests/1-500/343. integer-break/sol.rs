impl Solution {
    pub fn integer_break(n: i32) -> i32 {
        if n == 2 {
            return 1;
        }
        if n == 3 {
            return 2;
        }
        
        let mut threes = n / 3;
        let mut remainder = n % 3;
        
        if remainder == 1 {
            threes -= 1;
            remainder = 4;
        } else if remainder == 0 {
            remainder = 1;
        }
        
        let mut result = 1;
        for _ in 0..threes {
            result *= 3;
        }
        result * remainder
    }
}
