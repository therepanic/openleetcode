impl Solution {
    pub fn decode_string(s: String) -> String {
        let chars: Vec<char> = s.chars().collect();
        let mut i = 0;
        Self::decode(&chars, &mut i)
    }
    
    fn decode(chars: &Vec<char>, i: &mut usize) -> String {
        let mut res = String::new();
        let mut num = 0;
        while *i < chars.len() {
            let c = chars[*i];
            if c.is_digit(10) {
                num = num * 10 + c.to_digit(10).unwrap() as usize;
                *i += 1;
            } else if c == '[' {
                *i += 1;
                let inner = Self::decode(chars, i);
                for _ in 0..num {
                    res.push_str(&inner);
                }
                num = 0;
            } else if c == ']' {
                *i += 1;
                return res;
            } else {
                res.push(c);
                *i += 1;
            }
        }
        res
    }

    #[allow(non_snake_case)]
    pub fn decodeString(s: String) -> String {
        Self::decode_string(s)
    }
}
