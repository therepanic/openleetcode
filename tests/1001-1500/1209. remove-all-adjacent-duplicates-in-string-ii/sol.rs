impl Solution {
    pub fn remove_duplicates(s: String, k: i32) -> String {
        let mut stack: Vec<(char, i32)> = Vec::new();
        for c in s.chars() {
            if let Some(last) = stack.last_mut() {
                if last.0 == c {
                    last.1 += 1;
                } else {
                    stack.push((c, 1));
                }
            } else {
                stack.push((c, 1));
            }
            if stack.last().unwrap().1 == k {
                stack.pop();
            }
        }
        let mut result = String::new();
        for (c, count) in stack {
            for _ in 0..count {
                result.push(c);
            }
        }
        result
    }
}
