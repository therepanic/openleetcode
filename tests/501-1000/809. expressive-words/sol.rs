impl Solution {
    pub fn expressive_words(s: String, words: Vec<String>) -> i32 {
        fn encode(x: &str) -> (Vec<char>, Vec<i32>) {
            let mut chars = Vec::new();
            let mut cnts = Vec::new();
            let mut prev: Option<char> = None;
            let mut c = 0;
            for ch in x.chars() {
                if Some(ch) == prev {
                    c += 1;
                } else {
                    if let Some(p) = prev {
                        chars.push(p);
                        cnts.push(c);
                    }
                    prev = Some(ch);
                    c = 1;
                }
            }
            if let Some(p) = prev {
                chars.push(p);
                cnts.push(c);
            }
            (chars, cnts)
        }
        
        let (s_chars, s_cnts) = encode(&s);
        let mut ans = 0;
        for w in &words {
            let (w_chars, w_cnts) = encode(w);
            if s_chars != w_chars {
                continue;
            }
            let mut ok = true;
            for i in 0..s_cnts.len() {
                let sc = s_cnts[i];
                let wc = w_cnts[i];
                if sc < wc || (sc < 3 && sc != wc) {
                    ok = false;
                    break;
                }
            }
            if ok {
                ans += 1;
            }
        }
        ans
    }
}
