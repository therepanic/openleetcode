impl Solution {
    pub fn word_subsets(words1: Vec<String>, words2: Vec<String>) -> Vec<String> {
        let mut max_char_freq = vec![0; 26];
        let mut temp_char_freq = vec![0; 26];

        for word in &words2 {
            for ch in word.chars() {
                temp_char_freq[(ch as u8 - b'a') as usize] += 1;
            }
            for i in 0..26 {
                max_char_freq[i] = max_char_freq[i].max(temp_char_freq[i]);
            }
            temp_char_freq = vec![0; 26];
        }

        let mut universal_words = Vec::new();

        for word in &words1 {
            for ch in word.chars() {
                temp_char_freq[(ch as u8 - b'a') as usize] += 1;
            }
            let mut is_universal = true;
            for i in 0..26 {
                if max_char_freq[i] > temp_char_freq[i] {
                    is_universal = false;
                    break;
                }
            }
            if is_universal {
                universal_words.push(word.clone());
            }
            temp_char_freq = vec![0; 26];
        }

        universal_words
    }
}
