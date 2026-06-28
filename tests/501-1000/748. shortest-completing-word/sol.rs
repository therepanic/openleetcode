impl Solution {
    pub fn shortest_completing_word(license_plate: String, words: Vec<String>) -> String {
        let mut lp = [0; 26];
        for c in license_plate.to_lowercase().chars() {
            if c.is_ascii_alphabetic() {
                lp[(c as u8 - b'a') as usize] += 1;
            }
        }
        let mut ans: Option<String> = None;
        for w in words {
            let mut cw = [0; 26];
            for c in w.chars() {
                cw[(c as u8 - b'a') as usize] += 1;
            }
            let mut ok = true;
            for i in 0..26 {
                if cw[i] < lp[i] {
                    ok = false;
                    break;
                }
            }
            if ok && (ans.is_none() || w.len() < ans.as_ref().unwrap().len()) {
                ans = Some(w);
            }
        }
        ans.unwrap()
    }
}
