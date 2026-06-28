impl Solution {
    pub fn cal_points(operations: Vec<String>) -> i32 {
        let mut stack: Vec<i32> = Vec::new();
        for op in operations {
            if op == "C" {
                stack.pop();
            } else if op == "D" {
                stack.push(stack.last().unwrap() * 2);
            } else if op == "+" {
                let n = stack.len();
                stack.push(stack[n-1] + stack[n-2]);
            } else {
                stack.push(op.parse().unwrap());
            }
        }
        stack.iter().sum()
    }
}
