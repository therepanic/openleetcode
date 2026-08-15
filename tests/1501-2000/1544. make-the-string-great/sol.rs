impl Solution {
    pub fn make_good(s: String) -> String {
        let mut stack: Vec<char> = Vec::new();
        for ch in s.chars() {
            if let Some(&last) = stack.last() {
                if ch.to_ascii_lowercase() == last.to_ascii_lowercase() && ch != last {
                    stack.pop();
                    continue;
                }
            }
            stack.push(ch);
        }
        stack.into_iter().collect()
    }
}
