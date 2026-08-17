impl Solution {
    pub fn check_palindrome_formation(a: String, b: String) -> bool {
        let check = |a: &str, b: &str| -> bool {
            let a_chars: Vec<char> = a.chars().collect();
            let b_chars: Vec<char> = b.chars().collect();
            let mut i = 0;
            let mut j = a.len() - 1;
            while i < j && a_chars[i] == b_chars[j] {
                i += 1;
                j -= 1;
            }
            let sub_a: String = a_chars[i..=j].iter().collect();
            let sub_b: String = b_chars[i..=j].iter().collect();
            is_palindrome(&sub_a) || is_palindrome(&sub_b)
        };

        fn is_palindrome(s: &str) -> bool {
            let chars: Vec<char> = s.chars().collect();
            let len = chars.len();
            for i in 0..len / 2 {
                if chars[i] != chars[len - 1 - i] {
                    return false;
                }
            }
            true
        }

        check(&a, &b) || check(&b, &a)
    }
}
