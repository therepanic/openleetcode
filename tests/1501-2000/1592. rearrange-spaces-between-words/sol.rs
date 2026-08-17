impl Solution {
    pub fn reorder_spaces(text: String) -> String {
        let words: Vec<&str> = text.split_whitespace().collect();
        let total = text.chars().filter(|c| *c == ' ').count();
        if words.len() == 1 {
            return format!("{}{}", words[0], " ".repeat(total));
        }
        let gap = total / (words.len() - 1);
        let extra = total % (words.len() - 1);
        let sep = " ".repeat(gap);
        let joined = words.join(&sep);
        format!("{}{}", joined, " ".repeat(extra))
    }
}
