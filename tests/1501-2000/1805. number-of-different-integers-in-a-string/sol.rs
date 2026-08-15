impl Solution {
    pub fn num_different_integers(word: String) -> i32 {
        let chars: Vec<char> = word.chars().collect();
        let mut i = 0;
        let n = chars.len();
        let mut st = std::collections::HashSet::new();
        while i < n {
            while i < n && chars[i].is_alphabetic() {
                i += 1;
            }
            let mut temp_int = String::new();
            while i < n && chars[i].is_digit(10) {
                temp_int.push(chars[i]);
                i += 1;
            }
            let mut j = 0;
            while j + 1 < temp_int.len() && temp_int.as_bytes()[j] == b'0' {
                j += 1;
            }
            let k = &temp_int[j..];
            if !k.is_empty() {
                st.insert(k.to_string());
            }
        }
        st.len() as i32
    }
}
