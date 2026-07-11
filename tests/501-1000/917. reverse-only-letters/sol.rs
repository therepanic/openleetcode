impl Solution {
    pub fn reverse_only_letters(s: String) -> String {
        let mut chars: Vec<char> = s.chars().collect();
        let mut start: i32 = 0;
        let mut end: i32 = chars.len() as i32 - 1;
        loop {
            if start >= end {
                break;
            }
            
            let start_is_letter = chars[start as usize].is_alphabetic();
            let end_is_letter = chars[end as usize].is_alphabetic();
            
            if start_is_letter && end_is_letter {
                chars.swap(start as usize, end as usize);
                start += 1;
                end -= 1;
            } else if !start_is_letter {
                start += 1;
            } else {
                end -= 1;
            }
        }
        
        chars.into_iter().collect()
    }
}
