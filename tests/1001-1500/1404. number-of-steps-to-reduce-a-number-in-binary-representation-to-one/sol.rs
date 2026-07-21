impl Solution {
    pub fn num_steps(s: String) -> i32 {
        let mut steps = 0;
        let mut carry = 0;
        let bytes = s.as_bytes();
        
        for i in (1..bytes.len()).rev() {
            let bit = (bytes[i] - b'0') as i32 + carry;
            
            if bit == 1 {
                steps += 2;
                carry = 1;
            } else {
                steps += 1;
            }
        }
        
        steps + carry
    }
}
