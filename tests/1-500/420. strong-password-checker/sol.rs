impl Solution {
    pub fn strong_password_checker(password: String) -> i32 {
        use std::collections::HashSet;
        
        let lowercase: HashSet<char> = "abcdefghijklmnopqrstuvwxyz".chars().collect();
        let uppercase: HashSet<char> = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".chars().collect();
        let digit: HashSet<char> = "0123456789".chars().collect();
        
        let characters: HashSet<char> = password.chars().collect();
        
        let needs_lowercase = !characters.iter().any(|c| lowercase.contains(c));
        let needs_uppercase = !characters.iter().any(|c| uppercase.contains(c));
        let needs_digit = !characters.iter().any(|c| digit.contains(c));
        let num_required_type_replaces = 
            (if needs_lowercase { 1 } else { 0 }) +
            (if needs_uppercase { 1 } else { 0 }) +
            (if needs_digit { 1 } else { 0 });
        
        let num_required_inserts = std::cmp::max(0, 6 - password.len() as i32);
        let num_required_deletes = std::cmp::max(0, password.len() as i32 - 20);
        
        let mut groups: Vec<i32> = Vec::new();
        if !password.is_empty() {
            let chars: Vec<char> = password.chars().collect();
            let mut count = 1;
            for i in 1..chars.len() {
                if chars[i] == chars[i-1] {
                    count += 1;
                } else {
                    groups.push(count);
                    count = 1;
                }
            }
            groups.push(count);
        }
        
        for _ in 0..num_required_deletes {
            let mut argmin = 0;
            let mut min_val = i32::MAX;
            for (i, &group) in groups.iter().enumerate() {
                let val = if group >= 3 { group % 3 } else { 10 - group };
                if val < min_val {
                    min_val = val;
                    argmin = i;
                }
            }
            if argmin < groups.len() {
                groups[argmin] -= 1;
            }
        }
        
        let num_required_group_replaces: i32 = groups.iter().map(|&g| g / 3).sum();
        
        num_required_deletes + 
            std::cmp::max(
                num_required_type_replaces,
                std::cmp::max(num_required_group_replaces, num_required_inserts)
            )
    }
}
