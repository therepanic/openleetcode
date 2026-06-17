impl Solution {
    pub fn reverse_vowels(s: String) -> String {
        let vowels = "aeiouAEIOU";
        let mut chars: Vec<char> = s.chars().collect();
        let mut i = 0;
        let mut j = chars.len() - 1;
        while i < j {
            while i < j && !vowels.contains(chars[i]) {
                i += 1;
            }
            while i < j && !vowels.contains(chars[j]) {
                j -= 1;
            }
            if i < j {
                chars.swap(i, j);
                i += 1;
                j -= 1;
            }
        }
        chars.into_iter().collect()
    }
}
