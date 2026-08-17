impl Solution {
    pub fn get_lucky(s: String, k: i32) -> i32 {
        let mut res = String::new();
        for c in s.chars() {
            res += &(c as u8 - b'a' + 1).to_string();
        }
        for _ in 0..k {
            let sum: i32 = res.chars().map(|c| c.to_digit(10).unwrap() as i32).sum();
            res = sum.to_string();
        }
        res.parse().unwrap()
    }
}
