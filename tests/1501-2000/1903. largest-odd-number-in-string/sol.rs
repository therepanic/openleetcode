impl Solution {
    pub fn largest_odd_number(num: String) -> String {
        for (i, ch) in num.chars().rev().enumerate() {
            if ch.to_digit(10).unwrap() % 2 == 1 {
                let len = num.len() - i;
                return num[..len].to_string();
            }
        }
        String::new()
    }
}
