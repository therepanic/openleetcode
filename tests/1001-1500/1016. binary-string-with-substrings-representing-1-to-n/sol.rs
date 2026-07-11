impl Solution {
    pub fn query_string(s: String, n: i32) -> bool {
        let s_chars: Vec<char> = s.chars().collect();
        for num in (1..=n).rev() {
            let target = format!("{:b}", num);
            let length = target.len();
            let mut left = 0;
            let mut valid = false;
            for right in 0..s_chars.len() {
                while right - left + 1 > length {
                    left += 1;
                }
                let substring: String = s_chars[left..=right].iter().collect();
                if substring == target {
                    valid = true;
                    break;
                }
            }
            if !valid {
                return false;
            }
        }
        true
    }
}
