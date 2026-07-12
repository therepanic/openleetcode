impl Solution {
    pub fn score_of_parentheses(s: String) -> i32 {
        let mut score_stack: Vec<i32> = vec![0];
        
        for parentheses in s.chars() {
            if parentheses == '(' {
                score_stack.push(0);
            } else if !score_stack.is_empty() {
                let last_score = score_stack.pop().unwrap();
                let len = score_stack.len();
                score_stack[len - 1] += std::cmp::max(1, last_score * 2);
            }
        }
        
        score_stack[score_stack.len() - 1]
    }
}
