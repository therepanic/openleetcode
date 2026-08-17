impl Solution {
    pub fn max_value(n: String, x: i32) -> String {
        let xs = x.to_string();
        let chars: Vec<char> = n.chars().collect();
        if chars[0] != '-' {
            for (i, &c) in chars.iter().enumerate() {
                if xs.chars().next().unwrap() > c {
                    return format!("{}{}{}", &n[..i], xs, &n[i..]);
                }
            }
            return n + &xs;
        } else {
            for i in 1..chars.len() {
                if xs.chars().next().unwrap() < chars[i] {
                    return format!("{}{}{}", &n[..i], xs, &n[i..]);
                }
            }
            return n + &xs;
        }
    }
}
