impl Solution {
    pub fn repeated_substring_pattern(s: String) -> bool {
        let doubled = s.repeat(2);
        let inner = &doubled[1..doubled.len() - 1];
        inner.contains(&s[..])
    }

    pub fn repeatedSubstringPattern(s: String) -> bool {
        Self::repeated_substring_pattern(s)
    }
}
