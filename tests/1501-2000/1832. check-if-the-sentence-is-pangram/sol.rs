impl Solution {
    pub fn check_if_pangram(sentence: String) -> bool {
        if sentence.len() < 26 { return false; }
        
        for i in 0..26 {
            if !sentence.contains((97+i as u8) as char) { return false; }
        }
        true
    }
}
