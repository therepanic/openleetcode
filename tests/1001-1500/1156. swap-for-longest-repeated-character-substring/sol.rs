impl Solution {
    pub fn max_rep_opt1(text: String) -> i32 {
        use std::collections::HashMap;
        let mut total = HashMap::new();
        for c in text.chars() {
            *total.entry(c).or_insert(0) += 1;
        }
        let n = text.len();
        let mut ans = 0;
        let chars: Vec<char> = text.chars().collect();
        
        for (&ch, &ch_total) in &total {
            let mut left = 0;
            let mut count = 0;
            
            for right in 0..n {
                if chars[right] == ch {
                    count += 1;
                }
                
                while (right - left + 1) - count > 1 {
                    if chars[left] == ch {
                        count -= 1;
                    }
                    left += 1;
                }
                
                let window_len = (right - left + 1) as i32;
                ans = ans.max(window_len.min(ch_total));
            }
        }
        
        ans
    }
}
