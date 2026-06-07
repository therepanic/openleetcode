impl Solution {
    pub fn multiply(num1: String, num2: String) -> String {
        let n = num1.len();
        let m = num2.len();
        let bytes1 = num1.as_bytes();
        let bytes2 = num2.as_bytes();
        let mut result = vec![0; n + m];

        for i in (0..n).rev() {
            for j in (0..m).rev() {
                let mul = (bytes1[i] - b'0') as i32 * (bytes2[j] - b'0') as i32;
                let sum = mul + result[i + j + 1];
                result[i + j + 1] = sum % 10;
                result[i + j] += sum / 10;
            }
        }

        let mut k = 0;
        while k < result.len() && result[k] == 0 {
            k += 1;
        }
        if k == result.len() {
            return "0".to_string();
        }

        let mut product = String::new();
        for &digit in &result[k..] {
            product.push(char::from(b'0' + digit as u8));
        }
        product
    }
}
