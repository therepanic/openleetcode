impl Solution {
    pub fn largest_palindrome(n: i32) -> i32 {
        if n == 1 {
            return 9;
        }
        
        let min_num = (10_i64).pow((n - 1) as u32);
        let max_num = (10_i64).pow(n as u32) - 1;
        let mut max_pal = 0_i64;
        
        let mut i = max_num;
        while i >= min_num {
            if i * i < max_pal {
                break;
            }
            
            let mut j = max_num;
            while j >= i {
                let product = i * j;
                
                if product % 11 != 0 && product >= max_pal {
                    j -= 2;
                    continue;
                }
                
                let s = product.to_string();
                if s == s.chars().rev().collect::<String>() {
                    max_pal = product;
                }
                
                j -= 2;
            }
            
            i -= 2;
        }
        
        (max_pal % 1337) as i32
    }
}
