impl Solution {
    pub fn restore_ip_addresses(s: String) -> Vec<String> {
        fn is_valid(segment: &str) -> bool {
            if segment.len() > 1 && segment.as_bytes()[0] == b'0' {
                return false;
            }
            match segment.parse::<i32>() {
                Ok(value) => value <= 255,
                Err(_) => false,
            }
        }

        fn dfs(s: &str, index: usize, parts: &mut Vec<String>, result: &mut Vec<String>) {
            if parts.len() == 4 {
                if index == s.len() {
                    result.push(parts.join("."));
                }
                return;
            }

            for len in 1..=3 {
                if index + len > s.len() {
                    break;
                }
                let segment = &s[index..index + len];
                if is_valid(segment) {
                    parts.push(segment.to_string());
                    dfs(s, index + len, parts, result);
                    parts.pop();
                }
            }
        }

        let mut result = Vec::new();
        let mut parts = Vec::new();
        dfs(&s, 0, &mut parts, &mut result);
        result
    }
}
