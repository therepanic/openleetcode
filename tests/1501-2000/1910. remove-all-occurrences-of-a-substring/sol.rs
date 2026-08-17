impl Solution {
    pub fn remove_occurrences(s: String, part: String) -> String {
        let mut result_stack: Vec<char> = Vec::new();
        let target_length = part.len();
        let target_end_char = part.chars().last().unwrap();

        for current_char in s.chars() {
            result_stack.push(current_char);

            if current_char == target_end_char && result_stack.len() >= target_length {
                let start = result_stack.len() - target_length;
                if result_stack[start..].iter().collect::<String>() == part {
                    result_stack.truncate(start);
                }
            }
        }

        result_stack.into_iter().collect()
    }
}
