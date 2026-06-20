impl Solution {
    pub fn remove_invalid_parentheses(s: String) -> Vec<String> {
        fn is_valid(s: &str) -> bool {
            let mut ctr = 0i32;
            for ch in s.chars() {
                match ch {
                    '(' => ctr += 1,
                    ')' => {
                        if ctr == 0 {
                            return false;
                        }
                        ctr -= 1;
                    }
                    _ => {}
                }
            }
            ctr == 0
        }
        
        let mut level: std::collections::HashSet<String> = std::collections::HashSet::new();
        level.insert(s);
        loop {
            let valid: Vec<String> = level.iter().filter(|s| is_valid(s)).cloned().collect();
            if !valid.is_empty() {
                return valid;
            }
            let mut next_level = std::collections::HashSet::new();
            for str in &level {
                for i in 0..str.len() {
                    let mut new_str = String::new();
                    new_str.push_str(&str[..i]);
                    new_str.push_str(&str[i+1..]);
                    next_level.insert(new_str);
                }
            }
            level = next_level;
        }
    }
}
