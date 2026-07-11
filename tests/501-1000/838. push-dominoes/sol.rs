impl Solution {
    pub fn push_dominoes(dominoes: String) -> String {
        let s = format!("L{}R", dominoes);
        let mut res = String::new();
        let mut prev = 0;
        let chars: Vec<char> = s.chars().collect();
        for curr in 1..chars.len() {
            if chars[curr] == '.' {
                continue;
            }
            let span = curr - prev - 1;
            if prev > 0 {
                res.push(chars[prev]);
            }
            if chars[prev] == chars[curr] {
                for _ in 0..span {
                    res.push(chars[prev]);
                }
            } else if chars[prev] == 'L' && chars[curr] == 'R' {
                for _ in 0..span {
                    res.push('.');
                }
            } else {
                for _ in 0..span / 2 {
                    res.push('R');
                }
                if span % 2 == 1 {
                    res.push('.');
                }
                for _ in 0..span / 2 {
                    res.push('L');
                }
            }
            prev = curr;
        }
        res
    }
}
