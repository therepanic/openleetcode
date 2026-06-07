impl Solution {
    pub fn add_binary(a: String, b: String) -> String {
        let bytes_a = a.as_bytes();
        let bytes_b = b.as_bytes();
        let mut i = bytes_a.len() as i32 - 1;
        let mut j = bytes_b.len() as i32 - 1;
        let mut carry = 0;
        let mut res = Vec::new();

        while i >= 0 || j >= 0 || carry > 0 {
            let mut sum = carry;
            if i >= 0 {
                sum += (bytes_a[i as usize] - b'0') as i32;
                i -= 1;
            }
            if j >= 0 {
                sum += (bytes_b[j as usize] - b'0') as i32;
                j -= 1;
            }
            res.push(((sum % 2) as u8 + b'0') as char);
            carry = sum / 2;
        }

        res.iter().rev().collect()
    }
}
