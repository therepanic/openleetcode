impl Solution {
    pub fn decrypt(code: Vec<i32>, k: i32) -> Vec<i32> {
        let n = code.len();
        let mut result = vec![0; n];
        
        if k == 0 {
            return result;
        }

        let window = k.abs() as usize;
        let mut total = 0;

        let mut start = if k > 0 { 1 } else { n - window };
        let mut end = if k > 0 { window } else { n - 1 };

        for i in start..=end {
            total += code[i % n];
        }
        for i in 0..n {
            result[i] = total;

            total -= code[start % n];
            start += 1;

            end += 1;
            total += code[end % n];
        }
        result
    }
}
