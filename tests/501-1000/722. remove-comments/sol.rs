impl Solution {
    pub fn remove_comments(source: Vec<String>) -> Vec<String> {
        let mut in_block = false;
        let mut ans = Vec::new();
        let mut newline = String::new();
        for line in source {
            let mut i = 0;
            if !in_block {
                newline = String::new();
            }
            let chars: Vec<char> = line.chars().collect();
            while i < chars.len() {
                if i + 1 < chars.len() && chars[i] == '/' && chars[i + 1] == '*' && !in_block {
                    in_block = true;
                    i += 1;
                } else if i + 1 < chars.len() && chars[i] == '*' && chars[i + 1] == '/' && in_block {
                    in_block = false;
                    i += 1;
                } else if !in_block && i + 1 < chars.len() && chars[i] == '/' && chars[i + 1] == '/' {
                    break;
                } else if !in_block {
                    newline.push(chars[i]);
                }
                i += 1;
            }
            if !newline.is_empty() && !in_block {
                ans.push(newline.clone());
            }
        }
        ans
    }
}
