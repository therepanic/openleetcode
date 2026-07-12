impl Solution {
    pub fn ambiguous_coordinates(s: String) -> Vec<String> {
        let s = &s[1..s.len() - 1];
        let mut final_results = Vec::new();
        
        let get_valid_numbers = |num_str: &str| -> Vec<String> {
            let mut res = Vec::new();
            
            for i in 1..=num_str.len() {
                let left = &num_str[..i];
                let right = &num_str[i..];
                
                if (left.len() > 1 && left.starts_with('0')) || right.ends_with('0') {
                    continue;
                }
                
                if right.is_empty() {
                    res.push(left.to_string());
                } else {
                    res.push(format!("{}.{}", left, right));
                }
            }
            
            res
        };
        
        for i in 1..s.len() {
            let x_options = get_valid_numbers(&s[..i]);
            let y_options = get_valid_numbers(&s[i..]);
            
            for x in &x_options {
                for y in &y_options {
                    final_results.push(format!("({}, {})", x, y));
                }
            }
        }
        
        final_results
    }
}
