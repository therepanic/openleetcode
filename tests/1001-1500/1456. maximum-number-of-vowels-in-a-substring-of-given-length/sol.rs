impl Solution {
    fn is_vowel(c: char) -> bool {
        c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
    }
    
    pub fn max_vowels(s: String, k: i32) -> i32 {
        let s_chars: Vec<char> = s.chars().collect();
        let k = k as usize;
        let mut max_vowel = 0;
        let mut left = 0;
        let mut vowel = 0;
        
        for right in 0..s_chars.len() {
            if Self::is_vowel(s_chars[right]) {
                vowel += 1;
            }
            
            if (right - left + 1) == k {
                max_vowel = max_vowel.max(vowel);
                if Self::is_vowel(s_chars[left]) {
                    vowel -= 1;
                }
                left += 1;
            }
        }
        
        max_vowel
    }
}
