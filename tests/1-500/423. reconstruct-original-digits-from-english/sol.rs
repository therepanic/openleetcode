impl Solution {
    pub fn original_digits(s: String) -> String {
        let mut c = vec![0i32; 128];
        for ch in s.chars() {
            c[ch as usize] += 1;
        }
        let mut d = vec![0i32; 10];
        d[0] = c[b'z' as usize];
        d[2] = c[b'w' as usize];
        d[4] = c[b'u' as usize];
        d[6] = c[b'x' as usize];
        d[8] = c[b'g' as usize];
        d[1] = c[b'o' as usize] - d[0] - d[2] - d[4];
        d[3] = c[b'h' as usize] - d[8];
        d[5] = c[b'f' as usize] - d[4];
        d[7] = c[b's' as usize] - d[6];
        d[9] = c[b'i' as usize] - d[5] - d[6] - d[8];
        let mut result = String::new();
        for i in 0..10 {
            for _ in 0..d[i] {
                result.push_str(&i.to_string());
            }
        }
        result
    }
}
