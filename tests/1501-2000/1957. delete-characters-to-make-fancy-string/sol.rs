impl Solution {
    pub fn make_fancy_string(s: String) -> String {
        if s.is_empty() {
            return String::new();
        }
        let mut result = String::from(&s[..1]);
        let mut last = s.chars().next().unwrap();
        let mut count = 1;

        for ch in s.chars().skip(1) {
            if ch != last {
                last = ch;
                count = 0;
            }

            count += 1;
            if count > 2 {
                continue;
            }

            result.push(ch);
        }

        result
    }
}
