impl Solution {
    pub fn min_operations(logs: Vec<String>) -> i32 {
        let mut output = 0;
        for log in logs {
            if log == "../" {
                output -= 1;
                if output < 0 { output = 0; }
            } else if log == "./" {
                continue;
            } else {
                output += 1;
            }
        }
        if output < 0 { 0 } else { output }
    }
}
