impl Solution {
    pub fn solve_equation(equation: String) -> String {
        let parts: Vec<&str> = equation.split('=').collect();
        let (left_coeff, left_const) = Self::parse_side(parts[0]);
        let (right_coeff, right_const) = Self::parse_side(parts[1]);
        
        let coeff = left_coeff - right_coeff;
        let constant = right_const - left_const;
        
        if coeff == 0 {
            if constant != 0 {
                return "No solution".to_string();
            }
            return "Infinite solutions".to_string();
        }
        format!("x={}", constant / coeff)
    }
    
    fn parse_side(side: &str) -> (i32, i32) {
        let mut coeff = 0;
        let mut constant = 0;
        let mut num = String::new();
        let mut sign = 1;
        let expanded = format!("{}+", side);
        
        for ch in expanded.chars() {
            if ch == '+' || ch == '-' {
                if !num.is_empty() {
                    constant += sign * num.parse::<i32>().unwrap();
                    num.clear();
                }
                sign = if ch == '+' { 1 } else { -1 };
            } else if ch.is_digit(10) {
                num.push(ch);
            } else if ch == 'x' {
                if num.is_empty() {
                    coeff += sign * 1;
                } else {
                    coeff += sign * num.parse::<i32>().unwrap();
                    num.clear();
                }
            }
        }
        (coeff, constant)
    }
}
