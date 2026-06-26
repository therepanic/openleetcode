impl Solution {
    pub fn complex_number_multiply(num1: String, num2: String) -> String {
        fn parse_complex(s: &str) -> (i32, i32) {
            let parts: Vec<&str> = s.split('+').collect();
            let real: i32 = parts[0].parse().unwrap();
            let imag: i32 = parts[1][..parts[1].len()-1].parse().unwrap();
            (real, imag)
        }
        
        let (a, b) = parse_complex(&num1);
        let (c, d) = parse_complex(&num2);
        let real_part = a * c - b * d;
        let imag_part = a * d + b * c;
        format!("{}+{}i", real_part, imag_part)
    }
}
