impl Solution {
    pub fn longest_nice_substring(s: String) -> String {
        let len_s = s.len();
        if len_s <= 1 {
            return String::new();
        }

        let mut char_to_freq_map = std::collections::HashMap::new();
        for c in s.chars() {
            *char_to_freq_map.entry(c).or_insert(0) += 1;
        }
        
        let mut is_broken = false;
        let mut i = 0;
        let chars: Vec<char> = s.chars().collect();
        while (i < chars.len()) {
            let ch = chars[i];
            if ch.is_lowercase() && char_to_freq_map.contains_key(&ch.to_uppercase().next().unwrap()) {
                // pass
            } else if ch.is_uppercase() && char_to_freq_map.contains_key(&ch.to_lowercase().next().unwrap()) {
                // pass
            } else {
                is_broken = true;
                break;
            }
            i += 1;
        }

        if !is_broken {
            return s;
        }
        
        let left = &s[..i];
        let right = if i + 1 <= s.len() { &s[i+1..] } else { "" };
        
        let longest_nice_substr_1 = Self::longest_nice_substring(left.to_string());
        let longest_nice_substr_2 = Self::longest_nice_substring(right.to_string());
        
        if longest_nice_substr_1.len() >= longest_nice_substr_2.len() {
            longest_nice_substr_1
        } else {
            longest_nice_substr_2
        }
    }
}
