impl Solution {
    pub fn find_longest_word(s: String, dictionary: Vec<String>) -> String {
        let mut ans = String::new();
        let s_chars: Vec<char> = s.chars().collect();
        for word in dictionary {
            let w_chars: Vec<char> = word.chars().collect();
            let mut i = 0;
            let mut j = 0;
            while i < w_chars.len() && j < s_chars.len() {
                if w_chars[i] == s_chars[j] {
                    i += 1;
                }
                j += 1;
            }
            if i == w_chars.len() {
                if w_chars.len() > ans.len() {
                    ans = word;
                } else if w_chars.len() == ans.len() && word < ans {
                    ans = word;
                }
            }
        }
        ans
    }
}
