impl Solution {
    fn gcd(a: i32, b: i32) -> i32 {
        let mut x = a;
        let mut y = b;
        while y != 0 {
            let temp = y;
            y = x % y;
            x = temp;
        }
        x
    }

    pub fn fraction_addition(expression: String) -> String {
        let mut fractions: Vec<(i32, i32)> = Vec::new();
        let chars: Vec<char> = expression.chars().collect();
        let mut i = 0;
        while i < chars.len() {
            let sign = if chars[i] == '+' || chars[i] == '-' {
                let s = chars[i];
                i += 1;
                s
            } else {
                '+'
            };
            let mut numerator = 0;
            while i < chars.len() && chars[i].is_digit(10) {
                numerator = numerator * 10 + chars[i].to_digit(10).unwrap() as i32;
                i += 1;
            }
            i += 1; // skip '/'
            let mut denominator = 0;
            while i < chars.len() && chars[i].is_digit(10) {
                denominator = denominator * 10 + chars[i].to_digit(10).unwrap() as i32;
                i += 1;
            }
            let numerator = if sign == '-' { -numerator } else { numerator };
            fractions.push((numerator, denominator));
        }

        let mut common_denominator = 1;
        for &(_, den) in &fractions {
            common_denominator *= den / Self::gcd(common_denominator, den);
        }

        let mut total_numerator = 0;
        for &(num, den) in &fractions {
            total_numerator += num * (common_denominator / den);
        }

        let gcd_result = Self::gcd(total_numerator.abs(), common_denominator);
        total_numerator /= gcd_result;
        common_denominator /= gcd_result;

        format!("{}/{}", total_numerator, common_denominator)
    }
}
