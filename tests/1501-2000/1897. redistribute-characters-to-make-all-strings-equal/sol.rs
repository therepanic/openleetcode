impl Solution {
    pub fn make_equal(words: Vec<String>) -> bool {
        let mut freq = vec![0; 26];
        let n = words.len();
        for word in words {
            for ch in word.bytes() {
                freq[(ch - b'a') as usize] += 1;
            }
        }
        for count in freq {
            if count % n != 0 {
                return false;
            }
        }
        true
    }
}
