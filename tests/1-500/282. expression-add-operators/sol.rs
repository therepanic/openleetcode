impl Solution {
    pub fn add_operators(num: String, target: i32) -> Vec<String> {
        let mut res = Vec::new();
        let chars: Vec<char> = num.chars().collect();
        let n = chars.len();
        
        fn backtrack(
            chars: &[char],
            idx: usize,
            path: String,
            curr: i64,
            prev: i64,
            target: i64,
            res: &mut Vec<String>,
        ) {
            let n = chars.len();
            if idx == n {
                if curr == target {
                    res.push(path);
                }
                return;
            }
            let mut val: i64 = 0;
            for i in idx..n {
                if i > idx && chars[idx] == '0' {
                    break;
                }
                val = val * 10 + (chars[i] as i64 - '0' as i64);
                let s: String = chars[idx..=i].iter().collect();
                if idx == 0 {
                    backtrack(chars, i + 1, s.clone(), val, val, target, res);
                } else {
                    backtrack(chars, i + 1, format!("{}+{}", path, s), curr + val, val, target, res);
                    backtrack(chars, i + 1, format!("{}-{}", path, s), curr - val, -val, target, res);
                    backtrack(
                        chars,
                        i + 1,
                        format!("{}*{}", path, s),
                        (curr - prev) + (prev * val),
                        prev * val,
                        target,
                        res,
                    );
                }
            }
        }
        
        if n > 0 {
            backtrack(&chars, 0, String::new(), 0, 0, target as i64, &mut res);
        }
        res
    }
}
