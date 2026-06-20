impl Solution {
    pub fn to_hex(num: i32) -> String {
        if num == 0 {
            return "0".to_string();
        }
        let mut n = num as u32;
        let h: Vec<char> = "0123456789abcdef".chars().collect();
        let mut r = Vec::new();
        while n > 0 {
            r.push(h[(n & 15) as usize]);
            n /= 16;
        }
        r.reverse();
        r.into_iter().collect()
    }
}
