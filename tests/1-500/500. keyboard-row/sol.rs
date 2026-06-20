impl Solution {
    pub fn find_words(words: Vec<String>) -> Vec<String> {
        let mut m = [0u8; 26];
        for c in "qwertyuiop".chars() { m[(c as u8 - b'a') as usize] = 1; }
        for c in "asdfghjkl".chars() { m[(c as u8 - b'a') as usize] = 2; }
        for c in "zxcvbnm".chars() { m[(c as u8 - b'a') as usize] = 3; }
        let mut ans = Vec::new();
        for w in words {
            let lw = w.to_lowercase();
            let r = m[(lw.chars().next().unwrap() as u8 - b'a') as usize];
            if lw.chars().all(|ch| m[(ch as u8 - b'a') as usize] == r) {
                ans.push(w);
            }
        }
        ans
    }
}
