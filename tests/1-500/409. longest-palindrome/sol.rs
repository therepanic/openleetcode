impl Solution {
    pub fn longest_palindrome(s: String) -> i32 {
        use std::collections::HashMap;
        
        let mut count: HashMap<char, i32> = HashMap::new();
        for c in s.chars() {
            *count.entry(c).or_insert(0) += 1;
        }
        
        let mut max_len = 0;
        let mut odd = false;
        
        for &freq in count.values() {
            if freq % 2 == 0 {
                max_len += freq;
            } else {
                max_len += freq - 1;
                odd = true;
            }
        }
        
        max_len + if odd { 1 } else { 0 }
    }
}
