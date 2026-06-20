impl Solution {
    pub fn fraction_to_decimal(numerator: i32, denominator: i32) -> String {
        if numerator == 0 {
            return "0".to_string();
        }
        let mut result = String::new();
        let negative = (numerator < 0) ^ (denominator < 0);
        if negative {
            result.push('-');
        }
        let numerator = (numerator as i64).abs();
        let denominator = (denominator as i64).abs();
        result.push_str(&(numerator / denominator).to_string());
        let mut rem = numerator % denominator;
        if rem == 0 {
            return result;
        }
        result.push('.');
        let mut seen = std::collections::HashMap::<i64, usize>::new();
        while rem != 0 {
            if let Some(&idx) = seen.get(&rem) {
                result.insert(idx, '(');
                result.push(')');
                break;
            }
            seen.insert(rem, result.len());
            rem *= 10;
            result.push_str(&(rem / denominator).to_string());
            rem %= denominator;
        }
        result
    }
}
