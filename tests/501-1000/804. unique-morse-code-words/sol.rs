impl Solution {
    pub fn unique_morse_representations(words: Vec<String>) -> i32 {
        let storage = [
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
            "....", "..", ".---", "-.-", ".-..", "--", "-.",
            "---", ".--.", "--.-", ".-.", "...", "-", "..-",
            "...-", ".--", "-..-", "-.--", "--.."
        ];

        let mut st = std::collections::HashSet::new();

        for word in words {
            let mut temp = String::new();
            for ch in word.chars() {
                let index = (ch as u8 - b'a') as usize;
                temp.push_str(storage[index]);
            }
            st.insert(temp);
        }

        st.len() as i32
    }
}
