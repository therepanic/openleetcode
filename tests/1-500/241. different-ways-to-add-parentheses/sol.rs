impl Solution {
    pub fn diff_ways_to_compute(expression: String) -> Vec<i32> {
        if expression.chars().all(|c| c.is_digit(10)) {
            return vec![expression.parse::<i32>().unwrap()];
        }
        
        let mut results = Vec::new();
        
        for (i, char) in expression.chars().enumerate() {
            if char == '+' || char == '-' || char == '*' {
                let left_results = Solution::diff_ways_to_compute(expression[..i].to_string());
                let right_results = Solution::diff_ways_to_compute(expression[i+1..].to_string());
                
                for &left in &left_results {
                    for &right in &right_results {
                        match char {
                            '+' => results.push(left + right),
                            '-' => results.push(left - right),
                            '*' => results.push(left * right),
                            _ => {}
                        }
                    }
                }
            }
        }
        
        results
    }
}
