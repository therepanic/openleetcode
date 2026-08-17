impl Solution {
    pub fn min_insertions(s: String) -> i32 {
        let mut stack: Vec<char> = Vec::new();
        let mut count = 0;
        let chars: Vec<char> = s.chars().collect();
        let mut i = 0;
        
        while i < chars.len() {
            if chars[i] == '(' {
                stack.push('(');
            } else {
                if stack.is_empty() {
                    if i != chars.len() - 1 && chars[i + 1] == ')' {
                        count += 1;
                        i += 1;
                    } else {
                        count += 2;
                    }
                } else {
                    if i != chars.len() - 1 && chars[i + 1] == ')' {
                        stack.pop();
                        i += 1;
                    } else {
                        count += 1;
                        stack.pop();
                    }
                }
            }
            i += 1;
        }
        
        count + stack.len() as i32 * 2
    }
}
