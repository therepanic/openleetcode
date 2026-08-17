impl Solution {
    pub fn halves_are_alike(s: String) -> bool {
        let vowels = "aeiouAEIOU";
        let mid = s.len() / 2;
        let bytes = s.as_bytes();
        let mut count = 0;
        for i in 0..mid {
            if vowels.contains(bytes[i] as char) { count += 1; }
        }
        for i in mid..bytes.len() {
            if vowels.contains(bytes[i] as char) { count -= 1; }
        }
        count == 0
    }
}
