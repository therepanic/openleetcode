impl Solution {
    pub fn self_dividing_numbers(left: i32, right: i32) -> Vec<i32> {
        let mut lst = Vec::new();
        for i in left..=right {
            let s = i.to_string();
            if s.contains('0') {
                continue;
            }
            let mut b = 1;
            for ch in s.chars() {
                let digit = ch.to_digit(10).unwrap() as i32;
                if i % digit != 0 {
                    b = 0;
                    break;
                }
            }
            if b == 1 {
                lst.push(i);
            }
        }
        lst
    }
}
