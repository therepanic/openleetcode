impl Solution {
    pub fn calculate(s: String) -> i32 {
        let mut stack: Vec<i32> = Vec::new();
        let mut res = 0;
        let mut curr = 0;
        let mut sign = 1;

        for c in s.chars() {
            if c.is_digit(10) {
                curr = curr * 10 + c.to_digit(10).unwrap() as i32;
            } else if c == '+' {
                res += sign * curr;
                sign = 1;
                curr = 0;
            } else if c == '-' {
                res += sign * curr;
                sign = -1;
                curr = 0;
            } else if c == '(' {
                stack.push(res);
                stack.push(sign);
                res = 0;
                sign = 1;
            } else if c == ')' {
                res += sign * curr;
                curr = 0;
                res *= stack.pop().unwrap();
                res += stack.pop().unwrap();
            }
        }

        res += sign * curr;
        res
    }
}
