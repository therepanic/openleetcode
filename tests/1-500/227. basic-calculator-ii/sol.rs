impl Solution {
    pub fn calculate(s: String) -> i32 {
        let mut stack: Vec<i32> = Vec::new();
        let mut n = 0;
        let mut op = '+';
        let mut s = s;
        s.push('+');
        
        for c in s.chars() {
            if c == ' ' {
                continue;
            }
            
            if c.is_digit(10) {
                n = n * 10 + c.to_digit(10).unwrap() as i32;
                continue;
            }
            
            match op {
                '+' => stack.push(n),
                '-' => stack.push(-n),
                '*' => {
                    let last = stack.pop().unwrap();
                    stack.push(last * n);
                },
                '/' => {
                    let last = stack.pop().unwrap();
                    stack.push(last / n);
                },
                _ => {}
            }
            
            op = c;
            n = 0;
        }
        
        stack.iter().sum()
    }
}
