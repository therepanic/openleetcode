impl Solution {
    pub fn interpret(command: String) -> String {
        let mut result = String::new();
        let chars: Vec<char> = command.chars().collect();
        let mut i = 0;
        while i < chars.len() {
            if chars[i] == 'G' {
                result.push('G');
                i += 1;
            } else if i + 1 < chars.len() && chars[i] == '(' && chars[i+1] == ')' {
                result.push('o');
                i += 2;
            } else {
                result.push_str("al");
                i += 4;
            }
        }
        result
    }
}
