impl Solution {
    pub fn base_neg2(n: i32) -> String {
        if n == 0 {
            return "0".to_string();
        }
        let mut num = n;
        let mut res = String::new();
        while num != 0 {
            let digit = num & 1;
            res.push((b'0' + digit as u8) as char);
            num = (num - digit) / -2;
        }
        res.chars().rev().collect()
    }
}
