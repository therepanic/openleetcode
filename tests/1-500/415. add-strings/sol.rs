impl Solution {
    pub fn add_strings(num1: String, num2: String) -> String {
        let mut result: Vec<char> = Vec::new();
        let mut carry = 0;
        let num1_bytes = num1.as_bytes();
        let num2_bytes = num2.as_bytes();
        let mut i = num1.len() as i32 - 1;
        let mut j = num2.len() as i32 - 1;
        
        while i >= 0 || j >= 0 || carry > 0 {
            let digit1 = if i >= 0 { (num1_bytes[i as usize] - b'0') as i32 } else { 0 };
            let digit2 = if j >= 0 { (num2_bytes[j as usize] - b'0') as i32 } else { 0 };
            
            let total = digit1 + digit2 + carry;
            carry = total / 10;
            result.push((total % 10 + (b'0' as i32)) as u8 as char);
            
            i -= 1;
            j -= 1;
        }
        
        result.iter().rev().collect()
    }
}
