impl Solution {
    pub fn valid_ip_address(query_ip: String) -> String {
        if query_ip.matches('.').count() == 3 {
            let parts: Vec<&str> = query_ip.split('.').collect();
            let mut valid = true;
            for p in parts {
                if p.is_empty() || !p.chars().all(|c| c.is_digit(10)) {
                    valid = false;
                    break;
                }
                let num: i32 = p.parse().unwrap_or(-1);
                if num < 0 || num > 255 || num.to_string() != p {
                    valid = false;
                    break;
                }
            }
            if valid {
                return "IPv4".to_string();
            }
        } else if query_ip.matches(':').count() == 7 {
            let parts: Vec<&str> = query_ip.split(':').collect();
            let mut valid = true;
            for p in parts {
                if p.len() < 1 || p.len() > 4 {
                    valid = false;
                    break;
                }
                if !p.chars().all(|c| c.is_digit(16)) {
                    valid = false;
                    break;
                }
            }
            if valid {
                return "IPv6".to_string();
            }
        }
        "Neither".to_string()
    }
}
