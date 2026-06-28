impl Solution {
    pub fn convert_to_base7(num: i32) -> String {
        if num == 0 {
            return "0".to_string();
        }
        let sign = if num < 0 { "-" } else { "" };
        let mut num = num.abs();
        let mut result = String::new();
        while num > 0 {
            result = (num % 7).to_string() + &result;
            num /= 7;
        }
        sign.to_string() + &result
    }
}
