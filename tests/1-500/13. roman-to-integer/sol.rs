use std::collections::HashMap;

impl Solution {
    pub fn roman_to_int(s: String) -> i32 {
        let roman: HashMap<char, i32> = HashMap::from([
            ('I', 1),
            ('V', 5),
            ('X', 10),
            ('L', 50),
            ('C', 100),
            ('D', 500),
            ('M', 1000),
        ]);
        let chars: Vec<char> = s.chars().collect();
        let mut res = 0;
        for i in 0..chars.len() - 1 {
            if roman[&chars[i]] < roman[&chars[i + 1]] { res -= roman[&chars[i]]; } else { res += roman[&chars[i]]; }
        }
        res + roman[&chars[chars.len() - 1]]
    }
}
