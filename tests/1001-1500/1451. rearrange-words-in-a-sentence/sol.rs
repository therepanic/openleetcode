impl Solution {
    pub fn arrange_words(text: String) -> String {
        let mut s: Vec<String> = text.split_whitespace().map(|w| w.to_string()).collect();
        s.sort_by_key(|w| w.len());
        s = s.iter().map(|w| w.to_lowercase()).collect();
        if !s.is_empty() {
            s[0] = s[0][..1].to_uppercase() + &s[0][1..];
        }
        s.join(" ")
    }
}
