impl Solution {
    pub fn remove_palindrome_sub(s: String) -> i32 {
        let rev: String = s.chars().rev().collect();
        if s == rev { 1 } else { 2 }
    }
}
