impl Solution {
    pub fn subtract_product_and_sum(n: i32) -> i32 {
        let mut sum_digits = 0;
        let mut product_digits = 1;
        let mut n = n;
        
        while n > 0 {
            let digit = n % 10;
            sum_digits += digit;
            product_digits *= digit;
            n /= 10;
        }
        
        product_digits - sum_digits
    }
}
