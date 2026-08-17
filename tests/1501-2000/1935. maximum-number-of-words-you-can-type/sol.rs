impl Solution {
    pub fn can_be_typed_words(text: String, broken_letters: String) -> i32 {
        let mut b = vec![false; 26];
        let mut res = 0;

        for c in broken_letters.bytes() {
            b[(c - 97) as usize] = true;
        }

        for w in text.split(' ') {
            let mut ok = true;
            for c in w.bytes() {
                if b[(c - 97) as usize] {
                    ok = false;
                    break;
                }
            }
            if ok {
                res += 1;
            }
        }

        res
    }
}
