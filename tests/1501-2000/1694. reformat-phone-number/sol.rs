impl Solution {
    pub fn reformat_number(number: String) -> String {
        let phone_cleared: String = number.chars().filter(|c| c.is_digit(10)).collect();
        let mut result: Vec<String> = Vec::new();
        let mut phone = phone_cleared;
        
        while phone.len() > 4 {
            result.push(phone[..3].to_string());
            phone = phone[3..].to_string();
        }
        
        if phone.len() == 4 {
            result.push(phone[..2].to_string());
            result.push(phone[2..].to_string());
        } else if !phone.is_empty() {
            result.push(phone);
        }
        
        result.join("-")
    }
}
